/**
* YOLO26 detector wrapper for ORB-SLAM3 (OpenCV 5 DNN + ONNX).
*/

#include "YoloDetector.h"

#include <opencv2/imgproc.hpp>

#include <algorithm>
#include <cmath>
#include <iostream>
#include <stdexcept>

namespace ORB_SLAM3
{

namespace
{
const std::vector<std::string> kCOCONames = {
    "person"
};
} // namespace

const std::vector<std::string> &YoloDetector::COCONames()
{
    return kCOCONames;
}

std::string YoloDetector::ClassName(int classId)
{
    if(classId >= 0 && classId < static_cast<int>(kCOCONames.size()))
        return kCOCONames[classId];
    return std::to_string(classId);
}

YoloDetector::YoloDetector(const std::string &onnxPath,
                           float confThreshold,
                           int inputSize)
    : mConfThreshold(confThreshold), mInputSize(inputSize)
{
    if(mInputSize <= 0)
        throw std::invalid_argument("YoloDetector: inputSize must be positive");

    // OpenCV 5: ENGINE_AUTO picks the built-in graph engine when available.
    mNet = cv::dnn::readNetFromONNX(onnxPath, cv::dnn::ENGINE_AUTO);
    if(mNet.empty())
        throw std::runtime_error("YoloDetector: failed to load ONNX model: " + onnxPath);

    std::cout << "YoloDetector: loaded " << onnxPath
              << " (input " << mInputSize << "x" << mInputSize
              << ", conf=" << mConfThreshold << ")" << std::endl;
}

cv::Mat YoloDetector::Letterbox(const cv::Mat &img, float &ratio, int &padX, int &padY) const
{
    const int h = img.rows;
    const int w = img.cols;
    ratio = std::min(static_cast<float>(mInputSize) / h,
                     static_cast<float>(mInputSize) / w);

    const int nw = static_cast<int>(std::round(w * ratio));
    const int nh = static_cast<int>(std::round(h * ratio));

    cv::Mat resized;
    cv::resize(img, resized, cv::Size(nw, nh), 0, 0, cv::INTER_LINEAR);

    // Ultralytics letterbox pad color
    cv::Mat canvas(mInputSize, mInputSize, img.type(), cv::Scalar(114, 114, 114));
    padX = (mInputSize - nw) / 2;
    padY = (mInputSize - nh) / 2;
    resized.copyTo(canvas(cv::Rect(padX, padY, nw, nh)));
    return canvas;
}

std::vector<YoloDetection> YoloDetector::Detect(const cv::Mat &bgr) const
{
    std::vector<YoloDetection> dets;
    if(mNet.empty() || bgr.empty())
        return dets;

    cv::Mat img = bgr;
    if(img.channels() == 1)
        cv::cvtColor(img, img, cv::COLOR_GRAY2BGR);

    float ratio = 1.f;
    int padX = 0, padY = 0;
    cv::Mat padded = Letterbox(img, ratio, padX, padY);

    // RGB float32 in [0,1], NCHW
    cv::Mat blob = cv::dnn::blobFromImage(padded, 1.0 / 255.0,
                                          cv::Size(mInputSize, mInputSize),
                                          cv::Scalar(), /*swapRB=*/true, /*crop=*/false);

    mNet.setInput(blob);
    cv::Mat out = mNet.forward(); // [1, 300, 6]

    if(out.dims != 3 || out.type() != CV_32F || out.size[2] < 6)
    {
        std::cerr << "YoloDetector: unexpected output shape; expected [1,N,6] float" << std::endl;
        return dets;
    }
    if(!out.isContinuous())
        out = out.clone();

    const int rows = out.size[out.dims - 2];
    const int cols = out.size[out.dims - 1];
    const float *p = reinterpret_cast<const float*>(out.data);

    dets.reserve(rows);
    for(int i = 0; i < rows; ++i)
    {
        const float *row = p + static_cast<size_t>(i) * cols;
        const float score = row[4];
        if(score < mConfThreshold)
            continue;

        // Undo letterbox → original image pixels
        const float x1 = (row[0] - padX) / ratio;
        const float y1 = (row[1] - padY) / ratio;
        const float x2 = (row[2] - padX) / ratio;
        const float y2 = (row[3] - padY) / ratio;

        YoloDetection d;
        d.box = cv::Rect2f(x1, y1, x2 - x1, y2 - y1);
        d.conf = score;
        d.classId = static_cast<int>(row[5]);
        dets.push_back(d);
    }
    return dets;
}

cv::Mat YoloDetector::BuildDynamicMask(const cv::Size &size,
                                       const std::vector<YoloDetection> &dets,
                                       const std::vector<int> &dynamicClassIds) const
{
    // 255 = keep (static), 0 = dynamic region to drop
    cv::Mat mask(size, CV_8UC1, cv::Scalar(255));

    auto isDynamic = [&](int cls) -> bool
    {
        if(dynamicClassIds.empty())
            return true;
        return std::find(dynamicClassIds.begin(), dynamicClassIds.end(), cls)
               != dynamicClassIds.end();
    };

    for(const auto &d : dets)
    {
        if(!isDynamic(d.classId))
            continue;

        cv::Rect roi(cvRound(d.box.x), cvRound(d.box.y),
                     cvRound(d.box.width), cvRound(d.box.height));
        roi &= cv::Rect(0, 0, size.width, size.height);
        if(roi.width > 0 && roi.height > 0)
            mask(roi).setTo(0);
    }
    return mask;
}

} // namespace ORB_SLAM3

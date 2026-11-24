/**
* YOLO26 detector wrapper for ORB-SLAM3 (OpenCV 5 DNN + ONNX).
*
* Expects an end-to-end YOLO26 detect export:
*   input  "images"  [1, 3, 640, 640]
*   output "output0" [1, 300, 6]  = x1,y1,x2,y2,score,class_id
* Coordinates in the letterboxed 640x640 space; Detect() maps them back
* to the original image.
*/

#ifndef YOLODETECTOR_H
#define YOLODETECTOR_H

#include <opencv2/core.hpp>
#include <opencv2/dnn.hpp>

#include <string>
#include <vector>

namespace ORB_SLAM3
{

struct YoloDetection
{
    cv::Rect2f box;   // original-image pixels (x, y, w, h)
    float conf = 0.f;
    int classId = -1;
};

class YoloDetector
{
public:
    // Load ONNX model. inputSize must match the export (default 640).
    explicit YoloDetector(const std::string &onnxPath,
                          float confThreshold = 0.25f,
                          int inputSize = 640);

    bool IsLoaded() const { return !mNet.empty(); }

    // Run detection on a BGR (or gray) image. Returns boxes in original coords.
    std::vector<YoloDetection> Detect(const cv::Mat &bgr) const;

    // Binary mask: 255 = keep (static), 0 = drop (inside any detection box).
    // Optionally restrict to a set of class ids (empty = all classes).
    cv::Mat BuildDynamicMask(const cv::Size &size,
                             const std::vector<YoloDetection> &dets,
                             const std::vector<int> &dynamicClassIds = {}) const;

    float GetConfThreshold() const { return mConfThreshold; }
    void SetConfThreshold(float t) { mConfThreshold = t; }

    int GetInputSize() const { return mInputSize; }

    static const std::vector<std::string> &COCONames();
    static std::string ClassName(int classId);

private:
    cv::Mat Letterbox(const cv::Mat &img, float &ratio, int &padX, int &padY) const;

    // Mutable: OpenCV Net::setInput/forward are non-const, but Detect() is
    // logically const w.r.t. detector configuration.
    mutable cv::dnn::Net mNet;
    float mConfThreshold;
    int mInputSize;
};

} // namespace ORB_SLAM3

#endif // YOLODETECTOR_H

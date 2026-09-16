#!/bin/bash
pathDatasetEuroc='./datasets/machine_hall' #Example, it is necesary to change it by the dataset path

# Single Session Example (Pure visual)
echo "Launching MH01 with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH01/MH01 ./Examples/Stereo/EuRoC_TimeStamps/MH01.txt dataset-MH01_stereo
echo "------------------------------------"
echo "Evaluation of MH01 trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH01_GT.txt f_dataset-MH01_stereo.txt --plot evaluation/scripts/outputs/MH01_stereo.pdf --verbose


echo "Launching MH02 with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH02/MH02 ./Examples/Stereo/EuRoC_TimeStamps/MH02.txt dataset-MH02_stereo
echo "------------------------------------"
echo "Evaluation of MH02 trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH02_GT.txt f_dataset-MH02_stereo.txt --plot evaluation/scripts/outputs/MH02_stereo.pdf --verbose


echo "Launching MH03 with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH03/MH03 ./Examples/Stereo/EuRoC_TimeStamps/MH03.txt dataset-MH03_stereo
echo "------------------------------------"
echo "Evaluation of MH03 trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH03_GT.txt f_dataset-MH03_stereo.txt --plot evaluation/scripts/outputs/MH03_stereo.pdf --verbose


echo "Launching MH04 with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH04/MH04 ./Examples/Stereo/EuRoC_TimeStamps/MH04.txt dataset-MH04_stereo
echo "------------------------------------"
echo "Evaluation of MH04 trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH04_GT.txt f_dataset-MH04_stereo.txt --plot evaluation/scripts/outputs/MH04_stereo.pdf --verbose


echo "Launching MH05 with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH05/MH05 ./Examples/Stereo/EuRoC_TimeStamps/MH05.txt dataset-MH05_stereo
echo "------------------------------------"
echo "Evaluation of MH05 trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH05_GT.txt f_dataset-MH05_stereo.txt --plot evaluation/scripts/outputs/MH05_stereo.pdf --verbose


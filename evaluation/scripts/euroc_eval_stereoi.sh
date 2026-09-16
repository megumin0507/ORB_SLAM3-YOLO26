#!/bin/bash
pathDatasetEuroc='./datasets/machine_hall' #Example, it is necesary to change it by the dataset path

# Stereo-Inertial Examples
echo "Launching MH01 with Stereo-Inertial sensor"
./Examples/Stereo-Inertial/stereo_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH01/MH01 ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH01.txt dataset-MH01_stereoi
echo "------------------------------------"
echo "Evaluation of MH01 trajectory with Stereo-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH01/MH01/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH01_stereoi.txt --plot evaluation/scripts/outputs/MH01_stereoi.pdf --verbose


echo "Launching MH02 with Stereo-Inertial sensor"
./Examples/Stereo-Inertial/stereo_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH02/MH02 ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH02.txt dataset-MH02_stereoi
echo "------------------------------------"
echo "Evaluation of MH02 trajectory with Stereo-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH02/MH02/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH02_stereoi.txt --plot evaluation/scripts/outputs/MH02_stereoi.pdf --verbose


echo "Launching MH03 with Stereo-Inertial sensor"
./Examples/Stereo-Inertial/stereo_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH03/MH03 ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_stereoi
echo "------------------------------------"
echo "Evaluation of MH03 trajectory with Stereo-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH03/MH03/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_stereoi.txt --plot evaluation/scripts/outputs/MH03_stereoi.pdf --verbose


echo "Launching MH04 with Stereo-Inertial sensor"
./Examples/Stereo-Inertial/stereo_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH04/MH04 ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_stereoi
echo "------------------------------------"
echo "Evaluation of MH04 trajectory with Stereo-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH04/MH04/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_stereoi.txt --plot evaluation/scripts/outputs/MH04_stereoi.pdf --verbose


echo "Launching MH05 with Stereo-Inertial sensor"
./Examples/Stereo-Inertial/stereo_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH05/MH05 ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH05.txt dataset-MH05_stereoi
echo "------------------------------------"
echo "Evaluation of MH05 trajectory with Stereo-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH05/MH05/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH05_stereoi.txt --plot evaluation/scripts/outputs/MH05_stereoi.pdf --verbose

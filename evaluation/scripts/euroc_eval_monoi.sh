#!/bin/bash
pathDatasetEuroc='./datasets/machine_hall' #Example, it is necesary to change it by the dataset path

# Monocular-Inertial Examples
echo "Launching MH01 with Monocular-Inertial sensor"
./Examples/Monocular-Inertial/mono_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH01/MH01 ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH01.txt dataset-MH01_monoi
echo "------------------------------------"
echo "Evaluation of MH01 trajectory with Monocular-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH01/MH01/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH01_monoi.txt --plot evaluation/scripts/outputs/MH01_monoi.pdf --verbose


echo "Launching MH02 with Monocular-Inertial sensor"
./Examples/Monocular-Inertial/mono_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH02/MH02 ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH02.txt dataset-MH02_monoi
echo "------------------------------------"
echo "Evaluation of MH02 trajectory with Monocular-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH02/MH02/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH02_monoi.txt --plot evaluation/scripts/outputs/MH02_monoi.pdf --verbose


echo "Launching MH03 with Monocular-Inertial sensor"
./Examples/Monocular-Inertial/mono_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH03/MH03 ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_monoi
echo "------------------------------------"
echo "Evaluation of MH03 trajectory with Monocular-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH03/MH03/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_monoi.txt --plot evaluation/scripts/outputs/MH03_monoi.pdf --verbose


echo "Launching MH04 with Monocular-Inertial sensor"
./Examples/Monocular-Inertial/mono_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH04/MH04 ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_monoi
echo "------------------------------------"
echo "Evaluation of MH04 trajectory with Monocular-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH04/MH04/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_monoi.txt --plot evaluation/scripts/outputs/MH04_monoi.pdf --verbose


echo "Launching MH05 with Monocular-Inertial sensor"
./Examples/Monocular-Inertial/mono_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/MH05/MH05 ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH05.txt dataset-MH05_monoi
echo "------------------------------------"
echo "Evaluation of MH05 trajectory with Monocular-Inertial sensor"
python evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/MH05/MH05/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH05_monoi.txt --plot evaluation/scripts/outputs/MH05_monoi.pdf --verbose


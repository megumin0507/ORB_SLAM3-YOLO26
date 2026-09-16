#!/bin/bash
pathDatasetEuroc='./datasets/machine_hall' #Example, it is necesary to change it by the dataset path

# Single Session Example (Pure visual)
echo "Launching MH01 with Monocular sensor"
./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH01/MH01 ./Examples/Monocular/EuRoC_TimeStamps/MH01.txt dataset-MH01_mono
echo "------------------------------------"
echo "Evaluation of MH01 trajectory with Monocular sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH01_GT.txt f_dataset-MH01_mono.txt --plot evaluation/scripts/outputs/MH01_mono.pdf --verbose


echo "Launching MH02 with Monocular sensor"
./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH02/MH02 ./Examples/Monocular/EuRoC_TimeStamps/MH02.txt dataset-MH02_mono
echo "------------------------------------"
echo "Evaluation of MH02 trajectory with Monocular sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH02_GT.txt f_dataset-MH02_mono.txt --plot evaluation/scripts/outputs/MH02_mono.pdf --verbose


echo "Launching MH03 with Monocular sensor"
./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH03/MH03 ./Examples/Monocular/EuRoC_TimeStamps/MH03.txt dataset-MH03_mono
echo "------------------------------------"
echo "Evaluation of MH03 trajectory with Monocular sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH03_GT.txt f_dataset-MH03_mono.txt --plot evaluation/scripts/outputs/MH03_mono.pdf --verbose


echo "Launching MH04 with Monocular sensor"
./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH04/MH04 ./Examples/Monocular/EuRoC_TimeStamps/MH04.txt dataset-MH04_mono
echo "------------------------------------"
echo "Evaluation of MH04 trajectory with Monocular sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH04_GT.txt f_dataset-MH04_mono.txt --plot evaluation/scripts/outputs/MH04_mono.pdf --verbose


echo "Launching MH05 with Monocular sensor"
./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH05/MH05 ./Examples/Monocular/EuRoC_TimeStamps/MH05.txt dataset-MH05_mono
echo "------------------------------------"
echo "Evaluation of MH05 trajectory with Monocular sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH05_GT.txt f_dataset-MH05_mono.txt --plot evaluation/scripts/outputs/MH05_mono.pdf --verbose

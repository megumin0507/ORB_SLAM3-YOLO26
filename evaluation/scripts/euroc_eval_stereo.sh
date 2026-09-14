#!/bin/bash
pathDatasetEuroc='./datasets/machine_hall' #Example, it is necesary to change it by the dataset path

# Single Session Example (Pure visual)
echo "Launching MH_01_easy with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH_01_easy/MH_01_easy ./Examples/Stereo/EuRoC_TimeStamps/MH_01_easy.txt dataset-MH_01_easy_stereo
echo "------------------------------------"
echo "Evaluation of MH_01_easy trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH_01_easy_GT.txt f_dataset-MH_01_easy_stereo.txt --plot evaluation/scripts/outputs/MH_01_easy_stereo.pdf --verbose


echo "Launching MH_02_easy with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH_02_easy/MH_02_easy ./Examples/Stereo/EuRoC_TimeStamps/MH_02_easy.txt dataset-MH_02_easy_stereo
echo "------------------------------------"
echo "Evaluation of MH_02_easy trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH_02_easy_GT.txt f_dataset-MH_02_easy_stereo.txt --plot evaluation/scripts/outputs/MH_02_easy_stereo.pdf --verbose


echo "Launching MH_03_medium with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH_03_medium/MH_03_medium ./Examples/Stereo/EuRoC_TimeStamps/MH_03_medium.txt dataset-MH_03_medium_stereo
echo "------------------------------------"
echo "Evaluation of MH_03_medium trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH_03_medium_GT.txt f_dataset-MH_03_medium_stereo.txt --plot evaluation/scripts/outputs/MH_03_medium_stereo.pdf --verbose


echo "Launching MH_04_difficult with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH_04_difficult/MH_04_difficult ./Examples/Stereo/EuRoC_TimeStamps/MH_04_difficult.txt dataset-MH_04_difficult_stereo
echo "------------------------------------"
echo "Evaluation of MH_04_difficult trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH_04_difficult_GT.txt f_dataset-MH_04_difficult_stereo.txt --plot evaluation/scripts/outputs/MH_04_difficult_stereo.pdf --verbose


echo "Launching MH_05_difficult with Stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/EuRoC.yaml "$pathDatasetEuroc"/MH_05_difficult/MH_05_difficult ./Examples/Stereo/EuRoC_TimeStamps/MH_05_difficult.txt dataset-MH_05_difficult_stereo
echo "------------------------------------"
echo "Evaluation of MH_05_difficult trajectory with Stereo sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH_05_difficult_GT.txt f_dataset-MH_05_difficult_stereo.txt --plot evaluation/scripts/outputs/MH_05_difficult_stereo.pdf --verbose


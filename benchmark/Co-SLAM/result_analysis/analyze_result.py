import csv
import os
import json

# Define the root folder path
root_folder = '../coslam_output/Replica/'

# Initialize a list to store the results
results = []

perturb_mapping = {
    0: "brightness",
    1: "contrast",
    2: "spatter",
    3: "zoomBlur",
    4: "motionBlur",
    5: "defocusBlur",
    6: "gaussianNoise",
    7: "shotNoise",
    8: "impulseNoise",
    9: "speckleNoise",
    10: "gaussianBlur",
    11: "glassBlur",
    12: "fog",
    13: "frost",
    14: "snow",
    15: "jpegCompression",
    16: "pixelate",
    17: "noPerturb",
    18: "gaussianNoiseStrong",
    19: "removeImage"
}
severity_mapping={1:"low", 3:"mid", 5:"high", 0: "no"}
dynamic_mapping={0:"staticPerturbation", 1:"dynamicPerturbation"}

# Iterate over subfolders in the root folder
for foldername in os.listdir(root_folder):
    subfolder_path = os.path.join(root_folder, foldername)

    # Check if the subfolder is a directory
    if os.path.isdir(subfolder_path):
        # Iterate over subsubfolders in the subfolder
        for subsubfoldername in os.listdir(subfolder_path):
            subsubfolder_path = os.path.join(subfolder_path, subsubfoldername)

            # Check if output.txt exists in the subsubfolder
            output_file_path = os.path.join(subsubfolder_path, 'output.txt')
            if os.path.isfile(output_file_path):
                # Read the contents of output.txt
                with open(output_file_path, 'r') as file:
                    data = file.read()
                error_mean = float(data.split(' ')[5][:-1])
                perturb_config = subsubfoldername.split('_')
                # Append the results to the list
                if len(perturb_config)<=4:
                    
                    print( perturb_mapping[int(perturb_config[1])])
                    results.append((subfolder_path.split(os.sep)[-1], perturb_mapping[int(perturb_config[1])]+"_"+severity_mapping[int(perturb_config[2])]+"_"+dynamic_mapping[int(perturb_config[3])], error_mean))
                elif len(perturb_config)==6:
                    print(perturb_config)
                    results.append((subfolder_path.split(os.sep)[-1], perturb_mapping[int(perturb_config[1])]+"_"+severity_mapping[int(perturb_config[2])]+"_"+dynamic_mapping[int(perturb_config[3])]+str(perturb_config[5]), error_mean))
# Define the path to the output CSV file
csv_file_path = './replica_output.csv'

# Sort the results based on the subsubfolder name
results.sort(key=lambda x: x[1])
# Sort the results based on the subsubfolder name
results.sort(key=lambda x: x[0])

# Write the results to the CSV file
with open(csv_file_path, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['scene','perturbation_type_severity', 'ATE Mean'])  # Write header row
    writer.writerows(results)  # Write data rows

print("Results saved to", csv_file_path)
import csv
import os
import json

# Define the root folder path
root_folder =  '../coslam_output/Replica/'

# Initialize a list to store the results
results = []

# Custom decoder to handle property names without double quotes
def json_decode_pairs(pairs):
    # Convert the list of pairs to a dictionary
    data = dict(pairs)
    return data

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
                    try:
                        # Use custom decoder to handle JSON decoding
                        data = json.load(file, object_pairs_hook=json_decode_pairs)
                        
                        # Extract the value of 'absolute_translational_error.mean'
                        error_mean = data.get('absolute_translational_error.mean')

                        # Append the results to the list
                        results.append((subsubfoldername, error_mean))
                    except json.JSONDecodeError as e:
                        print(f"Error decoding JSON in {output_file_path}: {str(e)}")

# Define the path to the output CSV file
csv_file_path = './coslam_output.csv'

# Write the results to the CSV file
with open(csv_file_path, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Subsubfolder', 'Error Mean'])  # Write header row
    writer.writerows(results)  # Write data rows

print("Results saved to", csv_file_path)

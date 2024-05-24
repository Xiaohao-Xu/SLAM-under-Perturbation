import pandas as pd
import argparse

# Set up the argument parser
parser = argparse.ArgumentParser(description='Process CSV file path.')
parser.add_argument('--csv_path', type=str, help='Path to the CSV file')

# Parse arguments
args = parser.parse_args()
csv_path = args.csv_path

# Convert the CSV data to a DataFrame
df = pd.read_csv(csv_path)

# Count the number of rows where ATE Mean is less than or equal to 0.5
count = df[df['ATE Mean'] <= 0.2].shape[0]

# Print the count
print(count)


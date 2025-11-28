import matplotlib.pyplot as plt
import pandas as pd

# Read the CSV file
data = pd.read_csv('./replica_output.csv')

scene_list = ['office0','office1','office2','office3','office4','room0','room1','room2']

for sce in scene_list:
    # Filter the data for the 'office0' scene
    filtered_data = data[data['scene'] == sce]

    # Extract the necessary columns
    subsubfolder = filtered_data['Subsubfolder']
    error_mean = filtered_data['Error Mean']

    # Create a bar plot
    fig, ax = plt.subplots()

    # Assign colors to odd and even bars
    colors = ['blue' if i % 2 == 0 else 'orange' for i in range(len(subsubfolder))]

    # Plot the bars
    ax.bar(subsubfolder, error_mean, color=colors)

    # Customize the plot
    ax.set_xlabel('Subsubfolder')
    ax.set_ylabel('Error Mean')
    ax.set_title('Error Mean for office0 Scene')
    ax.set_xticklabels(subsubfolder, rotation=90)

    # Set the figure size
    fig.set_size_inches(50, 8)

    # Save the plot as a high-resolution image
    plt.savefig('../coslam_vis/'+sce+'_error_mean.png', dpi=500)

    # Close the plot
    plt.close()

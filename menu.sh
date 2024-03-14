#!/bin/bash

# Directory containing your images
image_dir="/home/jake/Images/wallpapers/void/"

# List all images in the directory
images=("$image_dir"/*)

# Create a temporary file to store the menu items
menu_file=$(mktemp)

# Populate the menu file with image paths
for image in "${images[@]}"; do
    echo "$image" >> "$menu_file"
done

# Use wofi to create an image menu
selected_image=$(wofi -p -d < "$menu_file")

# Check if a selection was made
if [ -n "$selected_image" ]; then
    echo "You selected: $selected_image"
    # Add your custom actions here using the selected image path
else
    echo "No image selected."
fi

# Remove the temporary file
rm -f "$menu_file"


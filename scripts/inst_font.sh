#!/bin/bash

# Change this to take the value of passed param instead (cross-platform Win/Linux)
config_dir="~/.emacs.d/assets/fonts/"

# Specify the name of your .zip file
zip_file="$config_dir"office_code_pro/Office-Code-Pro-master.zip

# Specify the destination directory for extracting the font
extract_dir="/tmp/font_extraction"

# Create a temporary directory for extraction
mkdir -p "$extract_dir"

# Extract the .zip file
unzip "$zip_file" -d "$extract_dir"

# Find the TTF font file
font_file=$(find "$extract_dir" -type f -name "*.ttf" -print -quit)

# Check if the font file was found
if [ -z "$font_file" ]; then
    echo "Error: No TTF font file found in the extracted directory."
    exit 1
fi

# Install the TTF font
install_dir="/usr/share/fonts/truetype/custom"
mkdir -p "$install_dir"
cp "$font_file" "$install_dir"

# Update the font cache
fc-cache -f

# Clean up temporary files
rm -r "$extract_dir"

echo "Font installation completed successfully."

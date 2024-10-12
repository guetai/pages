#!/bin/bash

# Ensure we are in the correct directory
cd /edit/pages

# Generate HTML files from Markdown files
for file in *.md; do
    timestamp=$(date +%s)
    output_file="/public/pages/${timestamp}.html"

    # Convert Markdown to HTML
    markdown_content=$(cat "$file")

    # Replace images, videos, and audio
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')
    while IFS= read -r line; do
        name=$(echo "$line" | awk '{print $1}')
        url=$(echo "$line" | awk '{print $2}')
        extension="${url##*.}"
        case "$extension" in
            jpg|jpeg|png|gif)
                echo "<img src=\"$url\" alt=\"$name\">" >> "$output_file"
                ;;
            mp4|webm)
                echo "<video controls><source src=\"$url\" type=\"video/$extension\"></video>" >> "$output_file"
                ;;
            mp3|wav)
                echo "<audio controls><source src=\"$url\" type=\"audio/$extension\"></audio>" >> "$output_file"
                ;;
            *)
                echo "<!-- Unsupported media format: $url -->" >> "$output_file"
                ;;
        esac
    done <<< "$markdown_content"

    # Append HTML template
    cat /template/pages/index.html >> "$output_file"
done

# Sort HTML files by timestamp
ls -1tr /public/pages/*.html
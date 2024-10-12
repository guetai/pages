#!/bin/bash

# Ensure the output directory exists
mkdir -p /public/pages

# Process each markdown file in edit/pages
for file in /edit/pages/*.md; do
    # Extract timestamp from filename
    timestamp=$(basename "$file" .md)
    
    # Convert markdown to HTML
    markdown_content=$(cat "$file")
    
    # Replace images, videos, or audio
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')
    while read line; do
        name=$(echo "$line" | awk '{print $1}')
        url=$(echo "$line" | awk '{print $2}')
        extension="${url##*.}"
        case "$extension" in
            jpg|jpeg|png|gif)
                echo "<img src=\"$url\" alt=\"$name\">" ;;
            mp4|webm)
                echo "<video controls><source src=\"$url\" type=\"video/$extension\"></video>" ;;
            mp3|wav)
                echo "<audio controls><source src=\"$url\" type=\"audio/$extension\"></audio>" ;;
            *)
                echo "<!-- Unsupported media format: $url -->" ;;
        esac
    done <<< "$markdown_content" > /public/pages/"$timestamp".html
    
    # Prepend HTML template
    cat /template/pages/index.html | sed "s|<body>|<body>\n$(cat /public/pages/"$timestamp".html)|" > /tmp/tmp.html && mv /tmp/tmp.html /public/pages/"$timestamp".html
done

# Sort generated files by timestamp
ls -t /public/pages/*.html | xargs -I {} mv {} /public/pages/$(basename {} .html).html
#!/bin/bash

# Ensure we're in the correct directory
cd /edit/pages || exit

# Create output directory if it doesn't exist
mkdir -p /public/pages

# Process each file in the directory
for file in *.md; do
    # Extract timestamp for filename
    timestamp=$(date +%s)
    outfile="/public/pages/${timestamp}.html"

    # Convert Markdown to HTML and apply custom processing
    markdown_content=$(cat "$file")
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')

    # Generate HTML
    echo "<!DOCTYPE html>" > "$outfile"
    echo "<html lang=\"zh-CN\">" >> "$outfile"
    echo "<head>" >> "$outfile"
    echo "    <meta charset=\"UTF-8\">" >> "$outfile"
    echo "    <title>Generated Page</title>" >> "$outfile"
    echo "</head>" >> "$outfile"
    echo "<body>" >> "$outfile"
    echo "    <!-- Content will be generated here -->" >> "$outfile"

    while IFS= read -r line; do
        if [[ $line == \[* ]]; then
            name=$(echo "$line" | awk '{print $1}')
            url=$(echo "$line" | awk '{print $2}')
            extension="${url##*.}"
            case "$extension" in
                jpg|jpeg|png|gif)
                    echo "<img src=\"$url\" alt=\"$name\">" >> "$outfile"
                    ;;
                mp4|webm)
                    echo "<video controls><source src=\"$url\" type=\"video/$extension\"></video>" >> "$outfile"
                    ;;
                mp3|wav)
                    echo "<audio controls><source src=\"$url\" type=\"audio/$extension\"></audio>" >> "$outfile"
                    ;;
                *)
                    echo "<!-- Unsupported media format: $url -->" >> "$outfile"
                    ;;
            esac
        else
            echo "$line" >> "$outfile"
        fi
    done <<< "$markdown_content"

    echo "</body>" >> "$outfile"
    echo "</html>" >> "$outfile"

done

# Sort files by timestamp
ls -t /public/pages/*.html | xargs -I {} mv {} $(dirname {})/$(basename {} | sort -n)
#!/bin/bash

# 设置输出目录
output_dir="/public/pages"

# 确保输出目录存在
mkdir -p "$output_dir"

# 处理每个Markdown文件
for file in /edit/pages/*.md; do
    # 生成HTML内容
    html_content=$(cat "$file" | markdown)

    # 替换图片、视频或音频
    html_content=$(echo "$html_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/' | while read line; do
        name=$(echo "$line" | awk '{print $1}')
        url=$(echo "$line" | awk '{print $2}')
        extension="${url##*.}"
        case "$extension" in
            jpg|jpeg|png|gif)
                echo "<img src=\"$url\" alt=\"$name\">"
                ;;
            mp4|webm)
                echo "<video controls><source src=\"$url\" type=\"video/$extension\"></video>"
                ;;
            mp3|wav)
                echo "<audio controls><source src=\"$url\" type=\"audio/$extension\"></audio>"
                ;;
            *)
                echo "<!-- Unsupported media format: $url -->"
                ;;
        esac
    done)

    # 生成时间戳作为文件名
    timestamp=$(date +%s)
    output_file="$output_dir/$timestamp.html"

    # 写入HTML文件
    echo "<!DOCTYPE html>" > "$output_file"
    echo "<html lang=\"zh-CN\">" >> "$output_file"
    echo "<head>" >> "$output_file"
    echo "    <meta charset=\"UTF-8\">" >> "$output_file"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> "$output_file"
    echo "    <title>动态生成页面</title>" >> "$output_file"
    echo "    <link rel=\"stylesheet\" href=\"/template/pages/index.css\">" >> "$output_file"
    echo "</head>" >> "$output_file"
    echo "<body>" >> "$output_file"
    echo "$html_content" >> "$output_file"
    echo "</body>" >> "$output_file"
    echo "</html>" >> "$output_file"
done

# 对生成的文件按时间排序
ls -1t "$output_dir"/*.html
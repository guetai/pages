#!/bin/bash

# 创建/public/pages目录
mkdir -p /public/pages

# 读取/edit/pages目录下的所有文件
for file in /edit/pages/*.md; do
    if [ -f "$file" ]; then
        # 获取文件名并生成时间戳作为文件名
        timestamp=$(date +%s)
        html_file="/public/pages/${timestamp}.html"

        # 读取 Markdown 内容
        markdown_content=$(cat "$file")

        # 处理 Markdown 内容
        markdown_content=$(echo "$markdown_content" | sed -E 's/^# (.*)$/<h1>\1<\/h1>/')
        markdown_content=$(echo "$markdown_content" | sed -E 's/^\[(.*)\]\((.*)\)/<a href="\2">\1<\/a>/')
        markdown_content=$(echo "$markdown_content" | sed -E 's/^!\[(.*)\]\((.*)\)/\1 \2/')

        # 替换图片、视频或音频
        markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')
        while IFS= read -r line; do
            name=$(echo "$line" | awk '{print $1}')
            url=$(echo "$line" | awk '{print $2}')
            extension="${url##*.}"
            case "$extension" in
                jpg|jpeg|png|gif)
                    echo "<img src=\"$url\" alt=\"$name\">" >> "$html_file"
                    ;;
                mp4|webm)
                    echo "<video controls><source src=\"$url\" type=\"video/$extension\"></video>" >> "$html_file"
                    ;;
                mp3|wav)
                    echo "<audio controls><source src=\"$url\" type=\"audio/$extension\"></audio>" >> "$html_file"
                    ;;
                *)
                    echo "<!-- Unsupported media format: $url -->" >> "$html_file"
                    ;;
            esac
        done <<< "$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')"

        # 输出 HTML 文件
        echo "<!DOCTYPE html>" > "$html_file"
        echo "<html lang=\"en\">" >> "$html_file"
        echo "<head>" >> "$html_file"
        echo "    <meta charset=\"UTF-8\">" >> "$html_file"
        echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> "$html_file"
        echo "    <title>这里是GUETAI项目组的宣传页面 😊</title>" >> "$html_file"
        echo "    <link rel=\"icon\" href=\"/res/icon/20241012.ico\">" >> "$html_file"
        echo "    <link rel=\"stylesheet\" href=\"/template/pages/index.css\">" >> "$html_file"
        echo "    <script src=\"/template/pages/index.js\" defer></script>" >> "$html_file"
        echo "</head>" >> "$html_file"
        echo "<body>" >> "$html_file"
        echo "$markdown_content" >> "$html_file"
        echo "</body>" >> "$html_file"
        echo "</html>" >> "$html_file"
    fi
done
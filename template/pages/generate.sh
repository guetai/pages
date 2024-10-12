#!/bin/bash

# 确保在模板目录运行此脚本
cd /template/pages

# 读取/edit/pages下的所有文件并按时间顺序处理
for file in $(ls -1t /edit/pages); do
    markdown_content=$(cat "/edit/pages/$file")

    # 处理Markdown内容
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')

    # 替换图片、视频或音频
    markdown_content=$(echo "$markdown_content" | sed -E 's/(.*) \((.*)\)/<p>\1<\/p>/g')
    markdown_content=$(echo "$markdown_content" | while read line; do
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

    # 生成HTML文件
    echo "<!DOCTYPE html>" > "/public/pages/$(date +%s).html"
    echo "<html lang=\"zh-CN\">" >> "/public/pages/$(date +%s).html"
    echo "<head>" >> "/public/pages/$(date +%s).html"
    echo "    <meta charset=\"UTF-8\">" >> "/public/pages/$(date +%s).html"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> "/public/pages/$(date +%s).html"
    echo "    <title>动态页面</title>" >> "/public/pages/$(date +%s).html"
    echo "    <link rel=\"stylesheet\" href=\"/template/pages/index.css\">" >> "/public/pages/$(date +%s).html"
    echo "</head>" >> "/public/pages/$(date +%s).html"
    echo "<body>" >> "/public/pages/$(date +%s).html"
    echo "$markdown_content" >> "/public/pages/$(date +%s).html"
    echo "</body>" >> "/public/pages/$(date +%s).html"
    echo "</html>" >> "/public/pages/$(date +%s).html"
done
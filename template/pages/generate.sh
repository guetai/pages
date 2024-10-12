#!/bin/bash

# 读取/edit/pages目录下的所有文件
for file in /edit/pages/*.md; do
    # 渲染 Markdown 文件
    markdown_content=$(cat "$file")

    # 替换标题
    markdown_content=$(echo "$markdown_content" | sed 's/^#\s\+\(.*\)/<h1>\1<\/h1>/')

    # 替换普通文本
    markdown_content=$(echo "$markdown_content" | sed 's/^\(.*\)$/<p>\1<\/p>/')

    # 替换链接
    markdown_content=$(echo "$markdown_content" | sed 's/\[\(.*\)\]\(\(.*\)\)/<a href="\2">\1<\/a>/')

    # 替换图片、视频或音频
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/' | while read line; do
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

    # 输出渲染结果
    output_file=$(basename "$file" .md).html
    echo "<!DOCTYPE html>" > "$output_file"
    echo "<html lang=\"en\">" >> "$output_file"
    echo "<head>" >> "$output_file"
    echo "    <meta charset=\"UTF-8\">" >> "$output_file"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> "$output_file"
    echo "    <title>这里是GUETAI项目组的宣传页面 😊</title>" >> "$output_file"
    echo "    <link rel=\"icon\" href=\"/res/icon/20241012.ico\">" >> "$output_file"
    echo "    <link rel=\"stylesheet\" href=\"/template/pages/index.css\">" >> "$output_file"
    echo "    <script src=\"/template/pages/index.js\" defer></script>" >> "$output_file"
    echo "</head>" >> "$output_file"
    echo "<body>" >> "$output_file"
    echo "    <header class=\"navigation\">" >> "$output_file"
    echo "        <nav>" >> "$output_file"
    echo "            <a href=\"/\" class=\"nav-link\">主页</a>" >> "$output_file"
    echo "            <a href=\"/about.html\" class=\"nav-link\">介绍</a>" >> "$output_file"
    echo "        </nav>" >> "$output_file"
    echo "    </header>" >> "$output_file"
    echo "" >> "$output_file"
    echo "    <main class=\"content\">" >> "$output_file"
    echo "        <section class=\"article\">" >> "$output_file"
    echo "            <h1 class=\"article-title\">Pages页面模版</h1>" >> "$output_file"
    echo "            <p class=\"article-text\">请不要直接访问模版，因为他无效</p>" >> "$output_file"
    echo "        </section>" >> "$output_file"
    echo "    </main>" >> "$output_file"
    echo "" >> "$output_file"
    echo "    <div class=\"mode-buttons\">" >> "$output_file"
    echo "        <button id=\"toggle-dark-mode\" class=\"dark-mode-button\"><span class=\"sun-icon\">☀️</span></button>" >> "$output_file"
    echo "        <button id=\"toggle-grave-mode\" class=\"grave-mode-button\"><span class=\"tombstone-icon\">🪦</span></button>" >> "$output_file"
    echo "    </div>" >> "$output_file"
    echo "" >> "$output_file"
    echo "    $markdown_content" >> "$output_file"
    echo "</body>" >> "$output_file"
    echo "</html>" >> "$output_file"

    echo "Generated $output_file from $file"
done
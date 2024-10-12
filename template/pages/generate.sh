#!/bin/bash

# 打印文件树
tree /edit/pages/

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
    echo "<!DOCTYPE html>"
    echo "<html lang='en'>"
    echo "<head>"
    echo "    <meta charset='UTF-8'>"
    echo "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
    echo "    <title>这里是GUETAI项目组的宣传页面</title>"
    echo "    <link rel='icon' href='/res/icon/20241012.ico'>"
    echo "    <link rel='stylesheet' href='/template/pages/index.css'>"
    echo "    <script src='/template/pages/index.js' defer></script>"
    echo "</head>"
    echo "<body>"
    echo "    <header class='navigation'>"
    echo "        <nav>"
    echo "            <a href='/'>主页</a>"
    echo "            <a href='/about.html'>介绍</a>"
    echo "        </nav>"
    echo "    </header>"
    echo "    <main class='content'>"
    echo "        <section class='article'>"
    echo "            <h1 class='article-title'>Pages页面模版</h1>"
    echo "            <p class='article-text'>请不要直接访问模版，因为他无效</p>"
    echo "$markdown_content"
    echo "        </section>"
    echo "    </main>"
    echo "    <footer class='buttons'>"
    echo "        <button id='toggle-dark-mode' class='dark-mode-button'><span class='sun-icon'>☀️</span></button>"
    echo "        <button id='toggle-grave-mode' class='grave-mode-button'><span class='tombstone-icon'>🪦</span></button>"
    echo "    </footer>"
    echo "</body>"
    echo "</html>"

    # 输出渲染后的 HTML 文件
    output_file=$(basename "$file" .md).html
    echo "$markdown_content" > "/template/pages/$output_file"
done
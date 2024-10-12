#!/bin/bash

# 创建输出目录
mkdir -p /public/pages

# 获取编辑目录下的所有文件
files=($(find /edit/pages -type f))

# 按照时间顺序排序
IFS=$'\n' files=($(sort -t. -k1,1 -k2n <<<"${files[*]}"))
unset IFS

# 遍历文件并生成HTML
for file in "${files[@]}"; do
    timestamp=$(date +%s -r "$file")
    output_file="/public/pages/${timestamp}.html"

    # 读取内容并转换为HTML
    markdown_content=$(cat "$file")

    # 替换标题
    title=$(echo "$markdown_content" | grep "^#" | sed 's/^# //')
    markdown_content=$(echo "$markdown_content" | sed '/^#/d')

    # 替换链接
    markdown_content=$(echo "$markdown_content" | sed 's/\[.*\]\(.*\)/<a href="\1">\1<\/a>/g')

    # 替换媒体
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

    # 生成HTML文件
    cat <<EOF > "$output_file"
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    <link rel="stylesheet" href="/template/pages/index.css">
    <script defer src="/template/pages/index.js"></script>
</head>
<body>
    <header class="navbar">
        <a href="/">主页</a>
        <a href="/about.html">介绍</a>
    </header>
    <div class="content-container">
        <h1 class="page-title">$title</h1>
        <div class="article-content">
            $markdown_content
        </div>
        <button class="mode-toggle dark-mode-toggle">☀️</button>
        <button class="mode-toggle tombstone-mode-toggle">🪦</button>
    </div>
    <div class="background-image"></div>
</body>
</html>
EOF
done
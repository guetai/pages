#!/bin/bash

# 确保编辑目录存在
if [ ! -d "/edit/pages" ]; then
    echo "编辑目录不存在，请确保 /edit/pages 存在。"
    exit 1
fi

# 清空公共目录
rm -rf /public/pages
mkdir -p /public/pages

# 获取所有Markdown文件并按时间排序
markdown_files=$(find /edit/pages -maxdepth 1 -type f -name "*.md" | sort -n)

for file in $markdown_files; do
    # 生成HTML文件名
    timestamp=$(date +%s -r "$file")
    html_file="/public/pages/${timestamp}.html"

    # 读取Markdown内容
    markdown_content=$(cat "$file")

    # 替换图片、视频或音频
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')
    while IFS=' ' read -r name url; do
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
    done <<< $(echo "$markdown_content")

    # 构建基本HTML结构
    cat <<EOF > "$html_file"
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>这里是GUETAI项目组的宣传页面</title>
    <link rel="icon" href="/res/icon/20241012.ico">
    <link rel="stylesheet" href="/template/pages/index.css">
</head>
<body>
    <header class="navigation">
        <a href="/" class="nav-item">主页</a>
        <a href="/about.html" class="nav-item">介绍</a>
    </header>

    <div class="content">
        <h1 class="page-title">Pages页面模版</h1>
        <p class="page-description">请不要直接访问模版，因为他无效</p>
    </div>

    <div class="theme-buttons">
        <button id="dark-mode-btn">&#9728;</button>
        <button id="grave-mode-btn">&#x2B1C;</button>
    </div>

    <script src="/template/pages/index.js"></script>
</body>
</html>
EOF

done
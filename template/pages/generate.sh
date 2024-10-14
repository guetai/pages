#!/bin/bash

<<<<<<< HEAD
rm -rf public/pages
# 创建输出目录
mkdir -p public/pages

# 获取编辑目录下的所有文件
files=($(find edit/pages -type f))
=======
# 确保在模板目录运行此脚本
cd /template/pages

# 读取/edit/pages下的所有文件并按时间顺序处理
for file in $(ls -1t /edit/pages); do
    markdown_content=$(cat "/edit/pages/$file")
>>>>>>> parent of 658d1cc (feature)

    # 处理Markdown内容
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')

<<<<<<< HEAD
# 获取文件的修改时间
get_timestamp() {
    if [ -f "$1" ]; then
        ls -l "$1" | awk '{print $6 " " $7 " " $8}'
    else
        echo "File not found: $1"
        return 1
    fi
}

# 遍历文件并生成HTML
for file in "${files[@]}"; do
    # 获取文件的修改时间
    timestamp=$(get_timestamp "$file")
    if [ $? -ne 0 ]; then
        continue
    fi

    output_file="public/pages/${timestamp}-${file##*/}.html"

    # 读取内容并转换为HTML
    markdown_content=$(cat "$file")

    # 替换标题
    title=$(echo "$markdown_content" | grep "^#" | sed 's/^# //')
    markdown_content=$(echo "$markdown_content" | sed '/^#/d')

    # 替换链接
    markdown_content=$(echo "$markdown_content" | sed 's/\[.*\]\(.*\)/<a href="\1">\1<\/a>/g')

    # 替换媒体
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/' | while read line; do
=======
    # 替换图片、视频或音频
    markdown_content=$(echo "$markdown_content" | sed -E 's/(.*) \((.*)\)/<p>\1<\/p>/g')
    markdown_content=$(echo "$markdown_content" | while read line; do
>>>>>>> parent of 658d1cc (feature)
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
<<<<<<< HEAD
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
=======
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
>>>>>>> parent of 658d1cc (feature)
done
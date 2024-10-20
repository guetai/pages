#!/bin/bash

# 确定public/pages目录是否存在
if [ ! -d "public/pages" ]; then
    mkdir -p public/pages
fi

# 读取edit/pages下的所有文件并按时间顺序处理
for file in $(ls -1t edit/pages); do
    # 获取文件的最后修改时间戳
    timestamp=$(stat -f "%m" "edit/pages/$file")

    # 获取文件名（不包括路径）
    filename=$(basename "$file")

    # 读取文件内容
    markdown_content=$(cat "edit/pages/$file")

    # 处理Markdown内容
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/')

    # 替换图片、视频或音频
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
                echo "<p>$line</p>"
                ;;
        esac
    done)

    # 生成HTML文件名
    output_file="${timestamp}_${filename%.md}.html"
    # 确保文件名中不包含特殊字符
    output_file=$(echo "$output_file" | tr -cd '[:alnum:]-_.')
    output_file="public/pages/$output_file"
    
    # 渲染HTML文件
    cat <<EOF > "$output_file"
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$filename</title>
    <link rel="stylesheet" href="/template/pages/index.css">
</head>
<body>
    <header class="navbar">
        <a href="/" class="nav-item">主页</a>
        <a href="/about.html" class="nav-item">介绍</a>
    </header>

    <div class="background-image"></div>

    <main class="content">
        <h1>$filename</h1>
        <p>以下是生成的内容：</p>
        $markdown_content
    </main>
</body>
</html>
EOF

    echo "生成文件: $output_file"
done
#!/bin/bash

# 遍历/edit/pages目录下的所有文件
for file in /edit/pages/*; do
    if [ -f "$file" ]; then
        # 读取文件的第一行作为标题
        title=$(head -n 1 "$file")
        # 剩余内容作为正文
        content=$(tail -n +2 "$file")

        # 使用模板生成HTML文件
        cat <<EOF > "${file%.*}.html"
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    <link rel="stylesheet" href="/template/pages/index.css">
    <script src="/template/pages/index.js" defer></script>
</head>
<body>
    <header>
        <nav>
            <a href="/">主页</a>
            <a href="/about.html">介绍</a>
        </nav>
    </header>
    <div class="background-image"></div>
    <main>
        <h1 id="article-title">$title</h1>
        <p id="article-content">$content</p>
    </main>
</body>
</html>
EOF
    fi
done
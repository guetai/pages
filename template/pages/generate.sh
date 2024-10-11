#!/bin/bash

# 读取/edit/pages目录下的所有文件
FILES=$(find /edit/pages -type f)

for FILE in $FILES; do
    # 读取文件内容
    TITLE=$(head -n 1 $FILE)
    CONTENT=$(tail -n +2 $FILE)

    # 生成HTML内容
    HTML_CONTENT="
    <!DOCTYPE html>
    <html lang='zh-CN'>
    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>这里是GUETAI项目组的宣传页面</title>
        <link rel='stylesheet' href='index.css'>
    </head>
    <body>
        <header>
            <nav>
                <a href='/'>主页</a>
                <a href='/about.html'>介绍</a>
            </nav>
        </header>

        <div class='content'>
            <h1>$TITLE</h1>
            <p>$CONTENT</p>
        </div>

        <script src='index.js'></script>
    </body>
    </html>
    "

    # 输出HTML内容到对应的HTML文件
    echo "$HTML_CONTENT" > "/template/pages/${FILE##*/}.html"
done
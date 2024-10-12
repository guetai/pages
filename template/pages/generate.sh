#!/bin/bash

# 读取/edit/pages目录下的所有文件
FILES=$(find /edit/pages -type f)

for FILE in $FILES; do
    # 读取文件内容
    TITLE=$(head -n 1 $FILE | sed 's/^# //')
    CONTENT=$(tail -n +2 $FILE)

    # 处理链接和媒体内容
    CONTENT=$(echo "$CONTENT" | sed 's/\[.*\]\(.*\)/<a href="\1">\1<\/a>/g')
    CONTENT=$(echo "$CONTENT" | sed 's/!\[.*\]\(.*\)/$(process_media "\1")/g')

    # 生成HTML内容
    HTML_CONTENT="
    <!DOCTYPE html>
    <html lang='zh-CN'>
    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>这里是GUETAI项目组的宣传页面 😢</title>
        <link rel='shortcut icon' href='/res/icon/20241012.ico'>
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

        <div class='mode-buttons'>
            <button id='dark-mode-button'>&#9728;</button>
            <button id='tombstone-mode-button'>&#128107;</button>
        </div>

        <script src='index.js'></script>
    </body>
    </html>
    "

    # 输出HTML内容到对应的HTML文件
    echo "$HTML_CONTENT" > "/template/pages/${FILE##*/}.html"
done

# 处理媒体内容
process_media() {
    MEDIA_URL="$1"
    EXTENSION="${MEDIA_URL##*.}"

    case $EXTENSION in
        jpg|jpeg|png|gif)
            echo "<img src='$MEDIA_URL' alt='图片'>"
            ;;
        mp4|webm)
            echo "<video controls><source src='$MEDIA_URL' type='video/$EXTENSION'></video>"
            ;;
        mp3|wav|ogg)
            echo "<audio controls><source src='$MEDIA_URL' type='audio/$EXTENSION'></audio>"
            ;;
        *)
            echo "<a href='$MEDIA_URL'>$MEDIA_URL</a>"
            ;;
    esac
}
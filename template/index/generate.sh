#!/bin/bash

# 定义输出文件前缀
output_prefix="public/index/index_"

# 确保输出目录存在
mkdir -p public/index

# 初始化计数器
page_counter=1

# 找到 /public/pages 下的所有文件，并按文件名逆序排序
find public/pages -type f -print0 | sort -zr | while IFS= read -r -d '' file; do
    # 处理每个文件
    echo "正在处理文件: $file"

    # 创建 index 文件
    output_file="${output_prefix}${page_counter}.html"

    # 初始化内容
    html_content=$(cat <<EOF
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title id="pageTitle">这里是GUETAI项目组的宣传页面</title>
    <link rel="icon" href="/res/icon/20241012.ico">
    <link rel="stylesheet" href="/template/pages/index.css">
    <script defer src="/template/pages/index.js"></script>
</head>
<body>
    <header class="navbar">
        <a href="/">主页</a>
        <a href="/about.html">介绍
EOF
)

    # 添加文件链接
    html_content+="<p><a href=\"$file\">$file</a></p>"

    # 关闭 HTML 标签
    html_content+=$(cat <<EOF
    </header>
</body>
</html>
EOF
)

    # 写入文件
    echo "$html_content" > "$output_file"

    # 增加计数器
    ((page_counter++))

done

echo "处理完成，共生成了 $((page_counter - 1)) 个页面。"
#!/bin/bash

echo "开始渲染文件..."
for file in edit/pages/*.txt; do
    if [[ -f "$file" ]]; then
        base_name=$(basename "$file" .txt)
        echo "正在处理: $base_name"
        
        # 提取标题和内容
        title=$(head -n 1 "$file")
        content=$(sed '1d' "$file" | tr '\n' '<br>') # 将换行转换为HTML换行
        
        # 创建HTML文件
        echo "<!DOCTYPE html>
<html lang='zh'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>${title}</title>
    <link rel='stylesheet' href='template/pages/index.css'>
</head>
<body>
    <header>
        <nav style='background-color: pink;'>
            <a href='/'>主页</a>
            <a href='/about.html'>介绍</a>
        </nav>
    </header>
    <div id='blurred-background'></div>
    <main>
        <h1 id='page-title'>$title</h1>
        <p id='page-content'>$content</p>
    </main>
    <script src='template/pages/index.js'></script>
</body>
</html>" > "./${base_name}.html"
    fi
done

echo "渲染完成."
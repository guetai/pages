请重新输出代码，在输出代码之前打印文件树（不要在bash里面打印），所有/都是相对于项目而言，是相对路径

请帮我实现一个脚本，大致如下：
1.读取/public/pages下所有文件，按照文件名称大小逆序排序并且储存链接
2.在/生成index.html，每个 <div class="content-container">存在10个
```
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
        <a href="/about.html">介绍</a>
    </header>
    <div class="content-container">
        <h1 class="page-title"></h1>//文件中的<title>内容标题
        <div class="article-content">
            <p></p>//文件里面第一个<p>里面内容，最多提取到第三个句号。
        </div>
        <button class="mode-toggle dark-mode-toggle">☀️</button>
        <button class="mode-toggle tombstone-mode-toggle">🪦</button>
    </div>
    <div class="content-container">
        <h1 class="page-title"></h1>
        <div class="article-content">
            <p></p>//如上
        </div>
        <button class="mode-toggle dark-mode-toggle">☀️</button>
        <button class="mode-toggle tombstone-mode-toggle">🪦</button>
    </div>
    //帮忙实现一个向下一页的按钮，按钮居中高斯模糊
    //如果是第一页，则不显示第一页、上一页
    //如果是中间页，则显示第一页、上一页、下一页、最后一页
    //如果是最后一页，则显示第一页、上一页、
    //当前页面居中显示，上一页和第一页之间用……连接，下一页同理
    <div class="background-image"></div>
</body>
</html>
```
3.生成/public/index/，文件命名为index_{1,2,3……}//逐渐增大并且直到文件链接全部放完
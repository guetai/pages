你好，我想请你用html+css帮我实现一个页面，要求如下:
* html和css分开（html在/template/pages/index.html,css在/template/pages/index.css,js在/template/pages/index.js）
* 标题:（正常）这里是GUETAI项目组的宣传页面（离开页面）请不要离开我～（这里选择一个颜文字表情，不要加入该括号文字）
* 具有导航（色调为粉色），导航固定在网页上方，具有指向主页(s.greenhandzdl.moe或者/)的主页和指向介绍页面的(s.greenhandzdl.moe/about.html或者/about.html)介绍
* 背景为随机图片（注意：该页面是github静态网页）
```
随机图片api:https://www.dmoe.cc/random.php
参数：type=json
JSON调用格式：https://www.dmoe.cc/random.php?return=json
JSON数据：
{
    "code":"200" #图片状态码
    "imgurl":"https:\/\/ws1.sinaimg.cn\/large\/0072Vf1pgy1foxkfy08umj31kw0w0nng.jpg" #图片地址
    "width":"2048" #图片宽
    "height":"1152" #图片高
}
```
* 文章部分为高斯模糊，可以看得到图片
* 文章标题加粗剧中，标题内容为“Pages页面模版”，文章内容为“请不要直接访问模版，因为他无效”（注意把文章相关放在一起）
除此之外，我想请你用bash实现渲染，要求如下：
* 读取/edit/pages目录下（不是/template/pages目录下）所有文件，并且进行渲染（注意：第一行文字是标题，其余是内容）
所有/都是相对于项目而言，是相对路径，bash文件放置于/template/pages/generate.sh
请在输出代码之前打印文件树

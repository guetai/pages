请重新输出代码，在输出代码之前打印文件树（不要在bash里面打印），所有/都是相对于项目而言，是相对路径
注意：该代码在Github Pages上面部署。

你好，我想请你用html+css帮我实现一个页面，要求如下:
* html和css分开（html在/template/pages/index.html,css在/template/pages/index.css,js在/template/pages/index.js）
* 标题:（正常）这里是GUETAI项目组的宣传页面（离开页面）请不要离开我～（这里选择一个颜文字表情，不要加入该括号文字）
* ICON：地址在/res/icon/20241012.ico
* 具有导航（色调为粉色），导航固定在网页上方，具有指向主页(s.greenhandzdl.moe或者/)的主页和指向介绍页面的(s.greenhandzdl.moe/about.html或者/about.html)介绍，导航可以点击跳转（行为类似于按钮）
* 导航在文章部分上方，滚动鼠标滚动时，导航固定在顶部，不要被文章给挡住
* 背景图片为固定的背景图片（要求平铺全部页面）,需要加入检测代码:
```
注意不要再次出现这些问题（注意css文件确保在设置背景图片之前，页面中的 .background-image 元素确实存在。）
[Error] TypeError: null is not an object (evaluating 'document.querySelector('.background-image').style')
	setBackgroundImage (index.js:13)
	全局代码 (index.js:23)
[Error] Failed to load resource: the server responded with a status of 500 (Request Blocked) (s.js, line 0)
```
```
PC端（横屏）：
/res/background/pc_image.png
移动端（竖屏）：
/res/background/mp_image.png
```
* 文章部分设置长宽度，不铺满，居中跟上下都有间隔，背景为高斯模糊（透明度稍微降低），有阴影感，可以看得到图片
* 文章标题加粗居中，标题内容为“Pages页面模版”，文章内容为“请不要直接访问模版，因为他无效”（注意把文章相关放在一起）
* 标题旁边出现两个“按钮”（可点击区域，实际上不是按钮）。
页面右下角功能请在javascript和css里面实现，不要访问外部链接
一个“按钮”为黑夜模式切换（注意实现自动切换，当处于白天则为默认，按钮是太阳的标志，当处于晚上则将导航栏颜色换成黑色，字体换成浅灰色，总之是偏黑色主题，按钮是月亮标志）。
另一个“按钮”是墓碑模式，按钮是墓碑的标志（默认是不打开，当打开是全局灰色，并且用灰色填充按钮）

除此之外，我想请你用bash（bash文件放置于/template/pages/generate.sh
）实现渲染，要求如下：
* 读取/edit/pages目录下（不是/template/pages目录下）所有文件，并且进行渲染
* 注意：渲染应该按照时间顺序，在/public/pages目录下生成，并且按照文件名排序，文件名是时间戳，文件名后缀是.html
* 渲染规则（重叠处参考上面内容）：
```
标题是#开头文字
没有任何标识符是内容
[链接显示名字](链接)

注意：以下需要用脚本在链接里面识别这是什么后缀，并且相应渲染出来，不要只用img标签来标注
![视频或者音频或者图片名字](链接)
类似于

    # 替换图片、视频或音频
    markdown_content=$(echo "$markdown_content" | sed -E 's/!\[(.*)\]\((.*)\)/\1 \2/' | while read line; do
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
```

第二次输入：
你生成代码的js中13行还是出现了问题。具体来说，我们需要确保在设置背景图片之前，页面中的.background-image 元素确实存在。
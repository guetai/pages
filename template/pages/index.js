// 获取随机图片URL
fetch('https://www.dmoe.cc/random.php?return=json')
    .then(response => response.json())
    .then(data => {
        if (data.code === '200') {
            const imageUrl = data.imgurl;
            document.querySelector('.background-image').style.backgroundImage = `url('${imageUrl}')`;
        }
    });

// 添加离开页面提示
document.addEventListener('beforeunload', function(e) {
    e.preventDefault();
    return '👋';
});
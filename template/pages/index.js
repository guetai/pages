// 获取随机图片URL
function getRandomImageUrl() {
    if (window.innerWidth >= 768) {
        return 'https://t.mwm.moe/pc';
    } else {
        return 'https://t.mwm.moe/mp';
    }
}

// 设置背景图片
function setBackgroundImage() {
    const imageUrl = getRandomImageUrl();
    document.querySelector('.background-image').style.backgroundImage = `url('${imageUrl}')`;
}

// 添加离开页面提示
document.addEventListener('beforeunload', function(e) {
    e.preventDefault();
    return '👋';
});

// 初始化背景图片
setBackgroundImage();
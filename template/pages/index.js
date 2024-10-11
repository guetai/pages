// 设置背景图片
function setBackgroundImage() {
    const imageUrl = window.matchMedia("(min-width: 768px)").matches ? '/template/pages/pc_image.png' : '/template/pages/mp_image.png';
    document.body.style.backgroundImage = `url('${imageUrl}')`;
}

// 添加离开页面提示
document.addEventListener('beforeunload', function(e) {
    e.preventDefault();
    return '👋 请不要离开我～';
});

// 初始化背景图片
setBackgroundImage();
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

// 切换暗黑模式
document.getElementById('dark-mode-button').addEventListener('click', function() {
    document.body.classList.toggle('dark-mode');
});

// 切换墓碑模式
document.getElementById('tombstone-mode-button').addEventListener('click', function() {
    document.body.classList.toggle('tombstone-mode');
});

// 初始化背景图片
setBackgroundImage();
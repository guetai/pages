// index.js
document.addEventListener('DOMContentLoaded', function() {
    function setBackgroundImage(url) {
        const backgroundImage = document.querySelector('.background-image');
        if (backgroundImage) {
            backgroundImage.style.backgroundImage = `url(${url})`;
        }
    }

    function checkScreenSize() {
        const screenWidth = window.innerWidth;
        if (screenWidth >= 768) {
            setBackgroundImage('/template/pages/pc_image.png');
        } else {
            setBackgroundImage('/template/pages/mp_image.png');
        }
    }

    // 设置背景图片
    checkScreenSize();

    // 监听屏幕尺寸变化
    window.addEventListener('resize', checkScreenSize);

    // 黑夜模式切换
    document.getElementById('toggle-dark-mode').addEventListener('click', function() {
        document.body.classList.toggle('dark-mode');
    });

    // 墓碑模式切换
    document.getElementById('toggle-grave-mode').addEventListener('click', function() {
        document.body.classList.toggle('grave-mode');
    });
});
document.addEventListener('DOMContentLoaded', function() {
    // 设置背景图片
    const setBackgroundImage = function(imageUrl) {
        const backgroundImage = document.querySelector('.background-image');
        if (backgroundImage) {
            backgroundImage.style.backgroundImage = `url(${imageUrl})`;
        } else {
            console.error('Element with class "background-image" not found.');
        }
    };

    // 切换黑夜模式
    document.getElementById('toggle-dark-mode').addEventListener('click', function() {
        document.body.classList.toggle('dark-mode');
    });

    // 切换墓碑模式
    document.getElementById('toggle-grave-mode').addEventListener('click', function() {
        document.body.classList.toggle('grave-mode');
    });

    // 初始化背景图片
    setBackgroundImage(window.innerWidth >= 768 ? '/template/pages/pc_image.png' : '/template/pages/mp_image.png');
});

window.addEventListener('resize', function() {
    const setBackgroundImage = function(imageUrl) {
        const backgroundImage = document.querySelector('.background-image');
        if (backgroundImage) {
            backgroundImage.style.backgroundImage = `url(${imageUrl})`;
        } else {
            console.error('Element with class "background-image" not found.');
        }
    };

    setBackgroundImage(window.innerWidth >= 768 ? '/template/pages/pc_image.png' : '/template/pages/mp_image.png');
});
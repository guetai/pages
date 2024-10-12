document.addEventListener('DOMContentLoaded', () => {
    // 获取随机图片URL
    function getRandomImageUrl() {
        if (window.innerWidth >= 768) {
            return '/template/pages/pc_image.png';
        } else {
            return '/template/pages/mp_image.png';
        }
    }

    // 设置背景图片
    function setBackgroundImage() {
        const backgroundImageElement = document.querySelector('.background-image');
        if (backgroundImageElement) {
            const imageUrl = getRandomImageUrl();
            backgroundImageElement.style.backgroundImage = `url('${imageUrl}')`;
        }
    }

    // 添加离开页面提示
    document.addEventListener('beforeunload', function(e) {
        e.preventDefault();
        return '👋';
    });

    // 初始化背景图片
    setBackgroundImage();

    // 黑夜模式切换
    const toggleDarkMode = () => {
        document.body.classList.toggle('dark-mode');
        document.getElementById('dark-mode-btn').innerText = document.body.classList.contains('dark-mode') ? '&#9788;' : '&#9728;';
    };

    // 墓碑模式切换
    const toggleGraveMode = () => {
        document.body.classList.toggle('grave-mode');
        document.getElementById('grave-mode-btn').innerText = document.body.classList.contains('grave-mode') ? '&#x26B0;' : '&#x2B1C;';
    };

    // 绑定事件监听器
    document.getElementById('dark-mode-btn').addEventListener('click', toggleDarkMode);
    document.getElementById('grave-mode-btn').addEventListener('click', toggleGraveMode);

    // 检查屏幕方向并更新背景图片
    const checkScreenOrientation = () => {
        setBackgroundImage();
    };

    // 监听窗口大小变化
    window.addEventListener('resize', checkScreenOrientation);
});
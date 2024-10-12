document.addEventListener('DOMContentLoaded', () => {
    const darkModeToggle = document.getElementById('darkModeToggle');
    const graveyardModeToggle = document.getElementById('graveyardModeToggle');

    let isDarkMode = false;
    let isGraveyardMode = false;

    function toggleDarkMode() {
        isDarkMode = !isDarkMode;
        document.body.classList.toggle('dark-mode', isDarkMode);
        darkModeToggle.textContent = isDarkMode ? '&#9788;' : '&#9728;';
    }

    function toggleGraveyardMode() {
        isGraveyardMode = !isGraveyardMode;
        document.body.classList.toggle('graveyard-mode', isGraveyardMode);
    }

    darkModeToggle.addEventListener('click', toggleDarkMode);
    graveyardModeToggle.addEventListener('click', toggleGraveyardMode);

// ...其他代码保持不变...

window.addEventListener('DOMContentLoaded', () => {
    // ...其他初始化代码...

    // 确保背景图元素存在再尝试设置图片
    const setBackgroundImageWhenReady = () => {
        const backgroundImageElement = document.querySelector('.background-image');
        if (backgroundImageElement) {
            setBackgroundImage(backgroundImageElement);
        } else {
            // 如果元素还不存在，稍后再试
            setTimeout(setBackgroundImageWhenReady, 100); // 例如，延迟100毫秒再次尝试
        }
    };

    setBackgroundImageWhenReady(); // 首次尝试设置背景图
});

function setBackgroundImage(element) {
    const isMobile = window.innerWidth <= 600;
    const imagePath = isMobile ? '/res/background/mp_image.png' : '/res/background/pc_image.png';
    element.style.backgroundImage = `url(${imagePath})`;
    // 可以在这里移除监听器，如果确定只设置一次
}
});
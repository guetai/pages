document.addEventListener('DOMContentLoaded', function() {
    // 确保 DOM 完全加载后再执行
    const darkModeToggle = document.querySelector('.dark-mode-toggle');
    const tombstoneModeToggle = document.querySelector('.tombstone-mode-toggle');

    // 检查 darkModeToggle 是否为 null
    if (!darkModeToggle) {
        console.error('无法找到 .dark-mode-toggle 元素');
    } else {
        darkModeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            darkModeToggle.textContent = document.body.classList.contains('dark-mode') ? '🌙' : '☀️';
        });
    }

    // 检查 tombstoneModeToggle 是否为 null
    if (!tombstoneModeToggle) {
        console.error('无法找到 .tombstone-mode-toggle 元素');
    } else {
        tombstoneModeToggle.addEventListener('click', () => {
            document.body.classList.toggle('tombstone-mode');
            tombstoneModeToggle.textContent = document.body.classList.contains('tombstone-mode') ? '🪦' : '🪦';
        });
    }
});

document.addEventListener('visibilitychange', function() {
    if (document.visibilityState === 'hidden') {
        document.title = '请不要离开我～';
    } else {
        document.title = '这里是GUETAI项目组的宣传页面';
    }
});

function setBackgroundImage() {
    const backgroundImage = document.querySelector('.background-image');
    if (backgroundImage) {
        backgroundImage.style.display = 'block';
    }
}

document.addEventListener('DOMContentLoaded', function() {
    setBackgroundImage();
});
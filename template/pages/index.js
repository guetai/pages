document.addEventListener('DOMContentLoaded', function() {
    // 获取暗黑模式切换按钮
    const darkModeToggle = document.querySelector('.dark-mode-toggle');
    // 获取墓碑模式切换按钮
    const tombstoneModeToggle = document.querySelector('.tombstone-mode-toggle');

    // 检查 darkModeToggle 是否为 null
    if (!darkModeToggle) {
        console.error('无法找到 .dark-mode-toggle 元素');
    } else {
        // 添加点击事件监听器
        darkModeToggle.addEventListener('click', toggleDarkMode);
    }

    // 检查 tombstoneModeToggle 是否为 null
    if (!tombstoneModeToggle) {
        console.error('无法找到 .tombstone-mode-toggle 元素');
    } else {
        // 添加点击事件监听器
        tombstoneModeToggle.addEventListener('click', toggleTombstoneMode);
    }
});

function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
    const darkModeToggle = document.querySelector('.dark-mode-toggle');
    if (darkModeToggle) {
        darkModeToggle.textContent = document.body.classList.contains('dark-mode') ? '🌙' : '☀️';
    }
}

function toggleTombstoneMode() {
    document.body.classList.toggle('tombstone-mode');
    const tombstoneModeToggle = document.querySelector('.tombstone-mode-toggle');
    if (tombstoneModeToggle) {
        tombstoneModeToggle.textContent = document.body.classList.contains('tombstone-mode') ? '🪦' : '🪦';
    }
}

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
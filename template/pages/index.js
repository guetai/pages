// index.js
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

    // 设置初始背景图片
    setBackgroundImage();
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
    if (!backgroundImage) {
        console.error('无法找到 .background-image 元素');
        return;
    }

    const isMobile = window.innerWidth <= 768; // 假设 768px 作为移动设备的阈值
    const imagePath = isMobile ? '/res/background/mp_image.png' : '/res/background/pc_image.png';

    backgroundImage.style.backgroundImage = `url(${imagePath})`;
}

// 添加鼠标光标切换逻辑
document.addEventListener('mousemove', function(event) {
    const target = event.target;

    if (target.tagName === 'A' && target.href) {
        document.body.classList.add('hover-link');
    } else {
        document.body.classList.remove('hover-link');
    }

    if (target.tagName === 'BUTTON') {
        document.body.classList.add('hover-button');
    } else {
        document.body.classList.remove('hover-button');
    }

    if (target.tagName === 'TEXTAREA' || target.tagName === 'INPUT') {
        document.body.classList.add('hover-input');
    } else {
        document.body.classList.remove('hover-input');
    }

    if (target.classList.contains('resizing')) {
        document.body.classList.add('resizing');
    } else {
        document.body.classList.remove('resizing');
    }

    if (target.classList.contains('resizing-horizontal')) {
        document.body.classList.add('resizing-horizontal');
    } else {
        document.body.classList.remove('resizing-horizontal');
    }

    if (target.classList.contains('resizing-diagonal')) {
        document.body.classList.add('resizing-diagonal');
    } else {
        document.body.classList.remove('resizing-diagonal');
    }

    if (target.classList.contains('resizing-diagonal-reverse')) {
        document.body.classList.add('resizing-diagonal-reverse');
    } else {
        document.body.classList.remove('resizing-diagonal-reverse');
    }

    if (target.classList.contains('dragging')) {
        document.body.classList.add('dragging');
    } else {
        document.body.classList.remove('dragging');
    }

    if (target.classList.contains('waiting')) {
        document.body.classList.add('waiting');
    } else {
        document.body.classList.remove('waiting');
    }

    if (target.classList.contains('working')) {
        document.body.classList.add('working');
    } else {
        document.body.classList.remove('working');
    }
});
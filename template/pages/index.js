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

setBackgroundImage();

const darkModeToggle = document.querySelector('.dark-mode-toggle');
const tombstoneModeToggle = document.querySelector('.tombstone-mode-toggle');

darkModeToggle.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
    darkModeToggle.textContent = document.body.classList.contains('dark-mode') ? '🌙' : '☀️';
});

tombstoneModeToggle.addEventListener('click', () => {
    document.body.classList.toggle('tombstone-mode');
    tombstoneModeToggle.textContent = document.body.classList.contains('tombstone-mode') ? '🪦' : '🪦';
});
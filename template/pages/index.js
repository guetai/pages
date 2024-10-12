document.addEventListener('DOMContentLoaded', function() {
    const setBackgroundImage = () => {
        const backgroundImage = document.querySelector('.background-image');
        if (backgroundImage) {
            setBackgroundImageStyle(backgroundImage);
        }
    };

    const setBackgroundImageStyle = (element) => {
        element.style.backgroundSize = "cover";
        element.style.backgroundPosition = "center";
    };

    const setupDarkModeToggle = () => {
        const darkModeToggle = document.getElementById('darkModeToggle');
        if (darkModeToggle) {
            darkModeToggle.addEventListener('click', () => {
                document.body.classList.toggle('dark-mode');
                darkModeToggle.textContent = document.body.classList.contains('dark-mode') ? '🌙' : '☀️';
            });
        }
    };

    const setupGraveyardModeToggle = () => {
        const graveyardModeToggle = document.getElementById('graveyardModeToggle');
        if (graveyardModeToggle) {
            graveyardModeToggle.addEventListener('click', () => {
                document.body.classList.toggle('graveyard-mode');
                graveyardModeToggle.textContent = document.body.classList.contains('graveyard-mode') ? '🖤' : '🪦';
            });
        }
    };

    setBackgroundImage();
    setupDarkModeToggle();
    setupGraveyardModeToggle();

    // 添加对夜间模式和墓碑模式的支持
    document.documentElement.style.setProperty('--dark-bg', '#121212');
    document.documentElement.style.setProperty('--dark-text', '#888');

    document.documentElement.style.setProperty('--graveyard-bg', '#aaa');
    document.documentElement.style.setProperty('--graveyard-text', '#555');
});
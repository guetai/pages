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

    // Background Image Detection
    window.addEventListener('load', () => {
        const backgroundImageElement = document.querySelector('.background-image');
        if (backgroundImageElement) {
            setBackgroundImage(backgroundImageElement);
        }
    });

    function setBackgroundImage(element) {
        const isMobile = window.innerWidth <= 600;
        const imagePath = isMobile ? '/res/background/mp_image.png' : '/res/background/pc_image.png';
        element.style.backgroundImage = `url(${imagePath})`;
        element.style.width = '100%';
        element.style.height = '100%';
        element.style.position = 'fixed';
        element.style.top = '0';
        element.style.left = '0';
        element.style.zIndex = '-1';
    }
});
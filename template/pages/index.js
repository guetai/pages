document.addEventListener('DOMContentLoaded', function() {
    const navbar = document.querySelector('.navbar');
    const contentContainer = document.querySelector('.content-container');
    const dayModeButton = document.querySelector('.day-mode');
    const tombstoneModeButton = document.querySelector('.tombstone-mode');

    function setBackgroundImage() {
        const backgroundImageElement = document.querySelector('.background-image');
        if (backgroundImageElement) {
            backgroundImageElement.style.backgroundImage = `url('/res/background/${window.innerWidth > 600 ? 'pc_image.png' : 'mp_image.png'})`;
        }
    }

    window.addEventListener('resize', setBackgroundImage);

    dayModeButton.addEventListener('click', function() {
        document.body.classList.toggle('dark-mode');
        dayModeButton.textContent = document.body.classList.contains('dark-mode') ? '🌙' : '☀️';
    });

    tombstoneModeButton.addEventListener('click', function() {
        document.body.classList.toggle('tombstone-mode');
        tombstoneModeButton.textContent = document.body.classList.contains('tombstone-mode') ? '🪦' : '🪦';
    });

    setBackgroundImage();
});
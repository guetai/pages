document.addEventListener('DOMContentLoaded', function() {
    const backgroundImage = document.querySelector('.background-image');
    if (backgroundImage) {
        setBackgroundImage();
    }

    const toggleDarkModeButton = document.getElementById('toggle-dark-mode');
    const toggleGraveModeButton = document.getElementById('toggle-grave-mode');

    toggleDarkModeButton.addEventListener('click', toggleDarkMode);
    toggleGraveModeButton.addEventListener('click', toggleGraveMode);

    function setBackgroundImage() {
        if (window.innerWidth > 600) {
            backgroundImage.style.backgroundImage = 'url("/template/pages/pc_image.png")';
        } else {
            backgroundImage.style.backgroundImage = 'url("/template/pages/mp_image.png")';
        }
    }

    function toggleDarkMode() {
        document.body.classList.toggle('dark-mode');
        toggleDarkModeButton.classList.toggle('active');
        toggleGraveModeButton.classList.remove('active');
    }

    function toggleGraveMode() {
        document.body.classList.toggle('grave-mode');
        toggleGraveModeButton.classList.toggle('active');
        toggleDarkModeButton.classList.remove('active');
    }
});
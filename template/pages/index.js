document.addEventListener('DOMContentLoaded', function () {
    const setBackgroundImage = () => {
        const backgroundImage = document.querySelector('.background-image');
        if (backgroundImage) {
            backgroundImage.style.backgroundImage = `url('/res/background/${window.innerWidth > 768 ? 'pc_image.png' : 'mp_image.png'}')`;
        }
    };

    const toggleDarkMode = () => {
        document.body.classList.toggle('dark-mode');
        document.getElementById('dark-mode-button').innerText = document.body.classList.contains('dark-mode') ? '&#9789;' : '&#9728;';
    };

    const toggleGraveMode = () => {
        document.body.classList.toggle('grave-mode');
        document.getElementById('grave-mode-button').innerText = document.body.classList.contains('grave-mode') ? '&#x26B0;' : '&#x26B0;';
    };

    document.getElementById('dark-mode-button').addEventListener('click', toggleDarkMode);
    document.getElementById('grave-mode-button').addEventListener('click', toggleGraveMode);

    setBackgroundImage();

    window.addEventListener('resize', setBackgroundImage);
});

// Additional CSS classes for dark and grave mode
document.documentElement.style.setProperty('--navbar-color', 'pink');
document.documentElement.style.setProperty('--navbar-text-color', 'black');

document.body.classList.add('dark-mode') && (document.documentElement.style.setProperty('--navbar-color', '#000'), document.documentElement.style.setProperty('--navbar-text-color', '#aaa'));
document.body.classList.add('grave-mode') && (document.documentElement.style.setProperty('--body-background', '#ccc'), document.documentElement.style.setProperty('--navbar-color', '#333'), document.documentElement.style.setProperty('--navbar-text-color', '#888'));
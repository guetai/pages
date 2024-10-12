document.addEventListener('DOMContentLoaded', () => {
    const setBackgroundImage = (imageSrc) => {
        if (document.querySelector('.background-image')) {
            document.querySelector('.background-image').style.backgroundImage = `url('${imageSrc}')`;
        }
    };

    const checkScreenOrientation = () => {
        if (window.innerWidth > window.innerHeight) {
            setBackgroundImage('/template/pages/pc_image.png');
        } else {
            setBackgroundImage('/template/pages/mp_image.png');
        }
    };

    const toggleDarkMode = () => {
        document.body.classList.toggle('dark-mode');
        document.getElementById('dark-mode-btn').innerText = document.body.classList.contains('dark-mode') ? '&#9788;' : '&#9728;';
    };

    const toggleGraveMode = () => {
        document.body.classList.toggle('grave-mode');
        document.getElementById('grave-mode-btn').innerText = document.body.classList.contains('grave-mode') ? '&#x26B0;' : '&#x2B1C;';
    };

    document.getElementById('dark-mode-btn').addEventListener('click', toggleDarkMode);
    document.getElementById('grave-mode-btn').addEventListener('click', toggleGraveMode);

    checkScreenOrientation();
    window.addEventListener('resize', checkScreenOrientation);
});
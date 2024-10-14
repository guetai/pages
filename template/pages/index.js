document.addEventListener('DOMContentLoaded', () => {
    const setBackgroundImage = () => {
        const backgroundImage = document.querySelector('.background-image');
        if (window.innerWidth > 600) {
            backgroundImage.style.backgroundImage = "url('/res/background/pc_image.png')";
        } else {
            backgroundImage.style.backgroundImage = "url('/res/background/mp_image.png')";
        }
    };

    const toggleDarkMode = () => {
        document.body.classList.toggle('dark-mode');
        const button = document.getElementById('toggleDarkMode');
        button.textContent = button.textContent === '☀️' ? '🌙' : '☀️';
    };

    const toggleGraveMode = () => {
        document.body.classList.toggle('grave-mode');
        const button = document.getElementById('toggleGraveMode');
        button.style.color = button.style.color === 'gray' ? 'black' : 'gray';
    };

    document.getElementById('toggleDarkMode').addEventListener('click', toggleDarkMode);
    document.getElementById('toggleGraveMode').addEventListener('click', toggleGraveMode);

    setBackgroundImage();
});
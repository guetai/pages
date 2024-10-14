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
        const button = document.querySelector('.dark-mode-toggle');
        button.textContent = button.textContent === '☀️' ? '🌙' : '☀️';
    };

    const toggleGraveMode = () => {
        document.body.classList.toggle('grave-mode');
        const button = document.querySelector('.tombstone-mode-toggle');
        button.style.color = button.style.color === 'gray' ? 'black' : 'gray';
    };

    document.querySelector('.dark-mode-toggle').addEventListener('click', toggleDarkMode);
    document.querySelector('.tombstone-mode-toggle').addEventListener('click', toggleGraveMode);

    setBackgroundImage();
});
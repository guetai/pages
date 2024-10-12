document.addEventListener('DOMContentLoaded', () => {
    const setBackgroundImage = (imageSrc) => {
        const backgroundImageElement = document.querySelector('.background-image');
        if (backgroundImageElement) {
            backgroundImageElement.style.backgroundImage = `url(${imageSrc})`;
        }
    };

    const updateBackgroundImage = () => {
        setBackgroundImage(window.innerWidth > 600 ? '/template/pages/pc_image.png' : '/template/pages/mp_image.png');
    };

    updateBackgroundImage();
    window.addEventListener('resize', updateBackgroundImage);

    document.querySelector('.dark-mode-toggle').addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');
    });

    document.querySelector('.tombstone-mode-toggle').addEventListener('click', () => {
        document.body.classList.toggle('tombstone-mode');
    });
});
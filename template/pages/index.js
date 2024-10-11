window.onload = function() {
    fetch('https://www.dmoe.cc/random.php?return=json')
        .then(response => response.json())
        .then(data => {
            if(data.code === '200') {
                document.getElementById('blurred-background').style.backgroundImage = `url('${data.imgurl}')`;
            } else {
                console.error('无法获取背景图片');
            }
        })
        .catch(error => console.error('请求图片API出错:', error));
};
document.addEventListener("DOMContentLoaded", function() {
    const sliders = document.querySelectorAll(".image-slider");

    sliders.forEach(slider => {
        let images = slider.querySelectorAll("img");
        let index = 0;

        function showNextImage() {
            images[index].classList.remove("active");
            index = (index + 1) % images.length;
            images[index].classList.add("active");
        }

        setInterval(showNextImage, 3000);
    });
});

document.addEventListener("DOMContentLoaded", function () {
    function moveSlider(direction, sliderId) {
        const slider = document.getElementById(sliderId);
        const slides = slider.children;
        const slideWidth = slides[0].offsetWidth;
        let currentTransform = slider.style.transform.match(/-?\d+/);
        let newTransform = (currentTransform ? parseInt(currentTransform[0]) : 0) + direction * slideWidth;

        if (newTransform > 0) {
            newTransform = -((slides.length - 1) * slideWidth);
        } else if (newTransform < -((slides.length - 1) * slideWidth)) {
            newTransform = 0;
        }

        slider.style.transform = `translateX(${newTransform}px)`;
    }
});

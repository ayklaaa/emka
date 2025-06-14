document.addEventListener("DOMContentLoaded", function() {
    let sliders = document.querySelectorAll(".carousel");
    sliders.forEach(slider => {
        new bootstrap.Carousel(slider, {
            interval: 3000,
            wrap: true
        });
    });
});
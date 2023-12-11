// 로고를 누르면 main으로 이동 //
const logo = document.querySelector("#logo > img");
logo.addEventListener("click", function() {
    location.href="http://127.0.0.1:5500/html/login_o.html";
});

// 광고 //
const sliderInner = document.querySelector(".sliderInner");
const slider = document.querySelectorAll(".slider");
let currrentIndex = 0;

sliderInner.style.transition = "all 1.6s";

setInterval(()=>{
    currrentIndex = (currrentIndex + 1) % slider.length;
    sliderInner.style.transform = "translateX(" + -1280 * currrentIndex + "px)";
}, 15000);
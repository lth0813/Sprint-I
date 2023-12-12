// 로고를 누르면 main으로 이동 //
const logo = document.querySelector("#logo > img");
logo.addEventListener("click", function() {
    location.href="http://localhost/main";
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

// 상세검색을 누르면 상세검색 모달창 띄우기 //
const modal = document.querySelector("#checkBox");
const modalButton = document.querySelector("#detailSearch");
const blur = document.querySelector("#allWrap");
modalButton.addEventListener("click", function() {
    modal.style.display = "block";
    blur.style.opacity = "0.5";
});

// 상세검색 모달창 닫기 버튼 //
const close = document.querySelector("#checkBoxX > p");
close.addEventListener("click", function() {
    modal.style.display = "none";
    blur.style.opacity = "1";
});

// 인기 상품을 클릭하면 해당 상품 상세 페이지로 이동 //
const kumho = document.querySelector("#kumho");
const nexen = document.querySelector("#nexen");
const hankook= document.querySelector("#hankook");
const continental = document.querySelector("#continental");
const michelin = document.querySelector("#michelin");
kumho.addEventListener("click", function() {
    location.href = "/";
});
nexen.addEventListener("click", function() {
    location.href = "/";
});
hankook.addEventListener("click", function() {
    location.href = "/";
});
continental.addEventListener("click", function() {
    location.href = "/";
});
michelin.addEventListener("click", function() {
    location.href = "/";
});

// 로그인, 장바구니, 마이페이지를 클릭하면 해당 페이지로 이동 //
const login = document.querySelector("#login");
const cart = document.querySelector("#cart");
const mypage= document.querySelector("#mypage");
if (login != null) {
    login.addEventListener("click", function() {
        location.href = "/login";
    });
}
cart.addEventListener("click", function() {
    location.href = "/cart";
});
mypage.addEventListener("click", function() {
    location.href = "/";
});

// 인기 상품 hover시 상품명 띄우기 //

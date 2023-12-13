// 주문 금액 가져오기
const priceElement = document.querySelector('.cartListDetail .price');
const orderAmount = priceElement.textContent.trim(); // 주문금액 텍스트를 가져옴

// 버튼 업데이트
const orderButton = document.querySelector('.cartBigorderbtn');
orderButton.textContent = `총 ${orderAmount} 결제하기`;

// 로고를 누르면 main으로 이동 //
const logo = document.querySelector("#logo > img");
logo.addEventListener("click", function() {
    location.href="http://localhost/main";
});

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

// 결제하기 버튼을 누르면 구매완료 모달창 띄우기 //
const modal2 = document.querySelector("#buyO");
const modalButton2 = document.querySelector(".cartBigorderbtn");
modalButton2.addEventListener("click", function() {
    modal2.style.display = "block";
    blur.style.opacity = "0.5";
});

// 구매완료 모달창 닫기 버튼 //
const close2 = document.querySelector("#buyOX > p");
close2.addEventListener("click", function() {
    modal2.style.display = "none";
    blur.style.opacity = "1";
});

// 로그인, 장바구니, 마이페이지를 클릭하면 해당 페이지로 이동 //
const login = document.querySelector("#login");
const cart = document.querySelector("#cart");
const mypage= document.querySelector("#mypage");
login.addEventListener("click", function() {
    location.href = "/login";
});
cart.addEventListener("click", function() {
    location.href = "/";
});
mypage.addEventListener("click", function() {
    location.href = "/";
});

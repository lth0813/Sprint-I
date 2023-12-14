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

//구매완료 페이지에서 구매내역조회 버튼 클릭시 해당 페이지로 이동//
const buyObtn = document.querySelector("#buyObtn");
buyObtn.addEventListener("click", function() {
    location.href = "/main";
});


// 수량에따라 주문금액 표기 -> 총(주문금액)결제하기 표기

function calculateButton() {
    var productRows = document.querySelectorAll('.cartListDetail'); // 상품 행 요소 가져오기
    var total = 0;

    // 상품 행의 주문 금액 계산
    productRows.forEach(function(row) {
        var count = parseInt(row.querySelector('.count').innerText); // 수량
        var priceText = row.querySelector('.price').innerText; // 가격 텍스트 
        var price = parseInt(priceText.replace(/[^0-9]/g, '')); // 가격 

        var orderPrice = count * price; 
        total += orderPrice; 

        row.querySelector('.price').innerText = orderPrice.toLocaleString() + '원'; 
    });

    // 총 주문금액을 표시하는 요소 가져와서 값 업데이트
    var orderBtn = document.querySelector('.cartBigorderbtn');
    orderBtn.innerText = `총 ${total.toLocaleString()}원 결제하기`;
}

// 수량이 변경될 때마다 calculateButton 함수 호출
var counts = document.querySelectorAll('.count');
counts.forEach(function (count) {
    count.addEventListener('input', calculateButton);
});

// 초기화: 페이지 로딩 시 총 주문금액 계산
calculateButton();


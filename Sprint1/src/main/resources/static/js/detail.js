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

// 로그인, 장바구니, 마이페이지를 클릭하면 해당 페이지로 이동 //
// + 로그인 안했을때 장바구니, 마이페이지를 클릭하면 alert //
const login = document.querySelector("#login");
const cart = document.querySelector("#cart");
const mypage= document.querySelector("#mypage");
if (login != null) {
    login.addEventListener("click", function() {
        location.href = "/login";
    });
}
cart.addEventListener("click", function() {
    if(login != null) {
        window.alert("로그인 후 이용해주세요.");
    } else {
        const id = document.querySelector(".userid").value;
        location.href = "/cart?id=" + id;
    }
});
mypage.addEventListener("click", function() {
    if(login != null) {
        window.alert("로그인 후 이용해주세요.");
    } else {
        const id = document.querySelector(".userid").value;
        location.href = "/mypage?id=" + id;    
    }
});

// 로그아웃 //
const logout = document.querySelector("#logout");
if(logout != null) {
    logout.addEventListener("click", function() {
        const form = document.forms.logout;
        form.submit();
});
}

// 수량 선택 안하고 장바구니버튼, 구매하기버튼 클릭시 수량선택요청alert 띄우기 //
// 장바구니버튼을 클릭하면 장바구니에 담기 완료 모달 띄우기 //
// 로그인 안하고 장바구니버튼, 구매하기버튼 클릭시 로그인요청alert 띄우기 //
const minus = document.querySelector(".qtyminus");
    const plus = document.querySelector(".qtyplus");
    const qty = document.querySelector(".qty");
    const product_price = parseInt(document.querySelector(".product_price").innerHTML.replace(/,/g,''))
    const product_qty = document.querySelector(".product_qty");
    const price = document.querySelector(".price")
    minus.addEventListener("click",() => {
        if (parseInt(qty.innerHTML) == 0) {
            qty.innerHTML = 0;
            product_qty.value = qty.innerHTML;
        }
        else {
            qty.innerHTML -= 1;
            price.innerHTML = parseInt(qty.innerHTML) * product_price;
            product_qty.value = qty.innerHTML;
        }
    })
    plus.addEventListener("click",() => {
        qty.innerHTML = parseInt(qty.innerHTML) +1;
        price.innerHTML = parseInt(qty.innerHTML) * product_price;
        product_qty.value = qty.innerHTML;
    })
    const cartinsert = document.querySelector(".cart");
    const cartBtnLoginX = document.querySelector(".userid");
    cartinsert.addEventListener("click",(e) => {
        if(logout != null) {
            if(parseInt(qty.innerHTML)<1){
                alert("수량을 선택해주세요");
                e.preventDefault();
            } else {
                // cartO.style.display = "block";
                return false;
            }
        } else {
            window.alert("로그인 후 이용해주세요.");
            e.preventDefault();
        }
    });

    const cartO = document.querySelector("#cartO");
    const checkmodal = document.querySelector(".modal");
    if (checkmodal != null) {
        if (checkmodal.innerHTML == "O") {
        cartO.style.display = "block";
        blur.style.opacity = "0.5";
    }}

    const orderinsert = document.querySelector(".purchase");
    orderinsert.addEventListener("click",(e) => {
        if(logout != null) {
            if(parseInt(qty.innerHTML)<1){
                alert("수량을 선택해주세요");
                e.preventDefault();
            }
        } else {
            window.alert("로그인 후 이용해주세요.");
            e.preventDefault();
        }
    });

// 장바구니에 담기 완료 모달 닫기 //
const cartOX = document.querySelector("#cartOX > p");
cartOX.addEventListener("click", function() {
    cartO.style.display = "none";
    blur.style.opacity = "1";
});


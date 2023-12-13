$(document).ready(function($) {
        $(".scroll_move").click(function(event){ console.log(".scroll_move"); 
            event.preventDefault();
        });
        $('html, body').animate({scrollTop:$(this.hash).offset().bottom - 60}, 100);
    });


function modifybtn(){
    alert('회원정보가 정상적으로 수정되었습니다.');
};


function deletebtn(){
    alert('리뷰가 정상적으로 삭제되었습니다.');
}



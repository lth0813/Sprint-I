package com.example.sprint1.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SprintDao {
    @Autowired
    JdbcTemplate jt;

// 회원 관련
    // 로그인
    public List<Map<String,Object>> login(String id, String pw) {
        String sqlStmt = String.format("SELECT * FROM user_list WHERE id = '%s' AND password = '%s'", id, pw);
        return jt.queryForList(sqlStmt);
    }
    // 회원가입
    public void register(String id, String pw, String name, String email, String phonenum) {
        String sqlStmt = String.format("INSERT INTO user_list (id, password, name, email, phonenumber) VALUES ('%s', '%s', '%s', '%s', '%s')", id, pw, name, email, phonenum);
        jt.execute(sqlStmt);
    }
    // 가입된 회원 확인
    public List<Map<String,Object>> checkdup(String id) {
        String sqlStmt = String.format("SELECT * FROM user_list WHERE id = '%s'", id);
        return jt.queryForList(sqlStmt);
    }
    // ID 찾기
    public List<Map<String,Object>> findId(String name, String email, String phonenum) {
        String sqlStmt = String.format("SELECT id FROM user_list WHERE name = '%s' AND email = '%s' AND phonenumber = '%s'", name, email, phonenum);
        return jt.queryForList(sqlStmt);
    }
    public List<Map<String,Object>> findIdcheck(String name, String email, String phonenum) {
        String sqlStmt = String.format("SELECT COUNT(*) cnt FROM user_list WHERE name = '%s' AND email = '%s' AND phonenumber = '%s'", name, email, phonenum);
        return jt.queryForList(sqlStmt);
    }
    // Password 찾기
    public List<Map<String,Object>> findPw(String id, String name, String email, String phonenum) {
        String sqlStmt = String.format("SELECT password FROM user_list WHERE id = '%s' AND name = '%s' AND email = '%s' AND phonenumber = '%s'",id, name, email, phonenum);
        return jt.queryForList(sqlStmt);
    }
    public List<Map<String,Object>> findPwcheck(String id, String name, String email, String phonenum) {
        String sqlStmt = String.format("SELECT COUNT(*) cnt FROM user_list WHERE id = '%s' AND name = '%s' AND email = '%s' AND phonenumber = '%s'",id, name, email, phonenum);
        return jt.queryForList(sqlStmt);
    }


// 리뷰
    // 리뷰 insert
    public void insertReview(String seq, String content, String id) {
        String sqlStmt = String.format("INSERT INTO review(seq, id, content, date) VALUES ('%s', '%s', '%s', NOW())", seq, id, content);
        jt.execute(sqlStmt);
    }
    // 리뷰 delete
    public void deleteReview(String review_seq) {
        String sqlStmt = String.format("DELETE FROM review WHERE review_seq = '%s'", review_seq);
        jt.execute(sqlStmt);
    }
    // 리뷰 update
    public void updateReview(String review_seq, String content) {
        String sqlStmt = String.format("UPDATE review SET content='%s', date=NOW() WHERE review_seq = %s",content, review_seq);
        jt.execute(sqlStmt);
    }
    // 상품에 달린 리뷰 개수 확인
    public List<Map<String,Object>> countReview(String seq) {
        String sqlStmt = String.format("SELECT COUNT(*) cnt FROM review WHERE seq = %s",seq);
        return jt.queryForList(sqlStmt);
    }
    // 본인이 쓴 리뷰 확인
    public List<Map<String,Object>> selectReview(String id) {
        String sqlStmt = String.format("SELECT * FROM review WHERE id = %s",id);
        return jt.queryForList(sqlStmt);
    }

// 검색 이력
    // 본인 검색 이력 확인
    public List<Map<String,Object>> selectSearchHistory(String id) {
        String sqlStmt = String.format("SELECT * FROM search_history WHERE id = %s",id);
        return jt.queryForList(sqlStmt);
    }
    // 검색 이력 insert
    public void insertSearchHistory(String seq, String id) {
        String sqlStmt = String.format("INSERT INTO search_history(seq, id) VALUES ('%s', '%s')", seq, id);
        jt.execute(sqlStmt);
    }
    // 검색 이력 delete
    public void deleteSearchHistory(String search_seq) {
        String sqlStmt = String.format("DELETE FROM search_history WHERE search_seq = '%s'", search_seq);
        jt.execute(sqlStmt);
    }

// 구매 이력
    // 본인 구매 이력 확인
    public List<Map<String,Object>> selectPurchaseHistory(String id) {
        String sqlStmt = String.format("SELECT * FROM purchase_history WHERE id = %s",id);
        return jt.queryForList(sqlStmt);
    }
    // 구매 이력 insert
    public void insertPurchaseHistory(String seq, String id, String qty) {
        String sqlStmt = String.format("INSERT INTO purchase_history(seq, id, purchase_qty, purchase_date) VALUES ('%s', '%s', '%s', NOW())", seq, id, qty);
        jt.execute(sqlStmt);
    }
    // 구매 이력 delete
    public void deletePurchaseHistory(String purchase_seq) {
        String sqlStmt = String.format("DELETE FROM purchase_history WHERE purchase_seq = '%s'", purchase_seq);
        jt.execute(sqlStmt);
    }

// 장바구니
    // 본인 장바구니 확인
    public List<Map<String,Object>> selectCart(String id) {
        String sqlStmt = String.format("SELECT * FROM cart WHERE id = %s",id);
        return jt.queryForList(sqlStmt);
    }
    // 장바구니 insert
    public void insertCart(String seq, String id, String qty) {
        String sqlStmt = String.format("INSERT INTO cart(seq, id, qty) VALUES ('%s', '%s', '%s')", seq, id, qty);
        jt.execute(sqlStmt);
    }
    // 장바구니 delete
    public void deleteCart(String cart_seq) {
        String sqlStmt = String.format("DELETE FROM cart WHERE cart_seq = '%s'", cart_seq);
        jt.execute(sqlStmt);
    }

// 상품 관련
    // 전체 상품 조회
    public List<Map<String,Object>> selectAll() {
        String sqlStmt = "SELECT * FROM tire_list";
        return jt.queryForList(sqlStmt);
    }



}

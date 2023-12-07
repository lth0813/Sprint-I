package com.example.sprint1.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SprintDao {
    @Autowired
    JdbcTemplate jt;

    // 회원가입
    public void register(String id, String pw, String name, String email, String phonenum) {
        String sqlStmt = String.format("INSERT INTO userlist (id, password, name, email, phonenumber) VALUES ('%s', '%s', '%s', '%s', '%s')", id, pw, name, email, phonenum);
        jt.execute(sqlStmt);
    }

}

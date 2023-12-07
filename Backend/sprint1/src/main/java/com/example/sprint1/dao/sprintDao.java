package com.example.sprint1.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class sprintDao {
    @Autowired
    JdbcTemplate jt;
    // 로그인
    public List<Map<String,Object>> login(String email, String pw) {
        String sqlStmt = String.format("SELECT * FROM user_list WHERE email = '%s' AND password = '%s'", email, pw);
        return jt.queryForList(sqlStmt);
    }
}

package com.example.sprint1.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.sprint1.dao.sprintDao;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class DBController {
    @Autowired
    sprintDao sprintdao;
    
    @PostMapping("/")
    public List<Map<String,Object>> login(
        @RequestParam("email") String email,
        @RequestParam("password") String password) {
            return sprintdao.login(email,password);
    }
}

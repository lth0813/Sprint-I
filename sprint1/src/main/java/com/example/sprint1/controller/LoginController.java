package com.example.sprint1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sprint1.dao.SprintDao;

@Controller

public class LoginController {
    @Autowired
    SprintDao sprintDao;
    @GetMapping("/login")
    public String logIn(){
        return "/html/login";
    }

    @GetMapping("/register")
    public String register(){
        return "/html/register";
    }
    @PostMapping("/register")
    public String registerPost(
        @RequestParam("id") String id,
        @RequestParam("pw") String pw,
        @RequestParam("name") String name,
        @RequestParam("email") String email,
        @RequestParam("phonenum") String phonenum
        ) {
            int check = sprintDao.checkdup(id).size();
            if (check > 0) {
                return "";
            }
            sprintDao.register(id, pw, name, email, phonenum);
            return "";
        }

    @GetMapping("/findid")
    public String findId(){
        return "/html/findid";
    }

    @GetMapping("/findpw")
    public String findPw(){
        return "/html/findpw";
    }
    
    @GetMapping("/findido")
    public String findido(){
        return "/html/findido";
    }

    @GetMapping("/findpwo")
    public String findPwo(){
        return "/html/findpwo";
    }
}

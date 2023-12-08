package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String logIn(){
        return "/html/login";
    }

    @GetMapping("/resister")
    public String resister(){
        return "/html/resister";
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

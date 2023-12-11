package com.example.sprint1.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.sprint1.dao.SprintDao;

import jakarta.servlet.http.HttpSession;

@Controller

public class LoginController {
    @Autowired
    SprintDao sprintDao;
    
    // 로그인
    @GetMapping("/login")
    public String login(@RequestParam(name = "error", required = false) String error, Model model) {
        if ("true".equals(error)) {
            model.addAttribute("error", true);
        } else {
            model.addAttribute("error", false);
        }
        return "/html/login";
    }
    @PostMapping("/login")
    public String loginPost(
        @RequestParam("id") String id,
        @RequestParam("pw") String pw,
        Model model,
        HttpSession session
    ){  
        int check = sprintDao.login(id, pw).size();
        if (check < 1) {
            return "redirect:/login?error=true";
        } else {
            Map<String,Object> user = sprintDao.login(id,pw).get(0);
            session.setAttribute("user", user);
            model.addAttribute("error", false);
            return "/main";
        }
    }

    // 회원가입
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
                return "redirect:/register";
            }
            sprintDao.register(id, pw, name, email, phonenum);
            return "/html/resistero";
        }
    // 중복검사
    @GetMapping("/check-duplicate")
    @ResponseBody
    public boolean checkDuplicate(@RequestParam("id") String id) {
        int check = sprintDao.checkdup(id).size();
        return check > 0;
    }
    
    // 아이디 찾기
    @GetMapping("/findid")
    public String findId(@RequestParam(name = "error", required = false) String error, Model model) {
        if ("true".equals(error)) {
            model.addAttribute("error", true);
        } else {
            model.addAttribute("error", false);
        }
        return "/html/findid";
    }
    @PostMapping("/findid")
    public String FindIdPost(
        @RequestParam("name") String name,
        @RequestParam("phonenum") String phonenum,
        @RequestParam("email") String email,
        Model model
    ){  
        int check = Integer.parseInt(sprintDao.findIdcheck(name, email, phonenum).get(0).get("cnt").toString());
        if (check < 1) {
            return "redirect:/findid?error=true";
        } else {
            String id = sprintDao.findId(name,email,phonenum).get(0).get("id").toString();
            model.addAttribute("error", false);
            return "redirect:/findido?id="+id;
        }
    }
    @GetMapping("/findido")
    public String findido(
        @RequestParam("id") String id,
        Model model
    ){
        model.addAttribute("id", id);
        return "/html/findido";
    }

    // 비밀번호 찾기
    @GetMapping("/findpw")
    public String findPw(@RequestParam(name = "error", required = false) String error, Model model) {
        if ("true".equals(error)) {
            model.addAttribute("error", true);
        } else {
            model.addAttribute("error", false);
        }
        return "/html/findpw";
    }
    @PostMapping("/findpw")
    public String FindPwPost(
        @RequestParam("id") String id,
        @RequestParam("name") String name,
        @RequestParam("phonenum") String phonenum,
        @RequestParam("email") String email,
        Model model
    ){  
        int check = Integer.parseInt(sprintDao.findPwcheck(id, name, email, phonenum).get(0).get("cnt").toString());
        if (check < 1) {
            return "redirect:/findpw?error=true";
        } else {
            String pw = sprintDao.findPw(id, name, email, phonenum).get(0).get("password").toString();
            model.addAttribute("error", false);
            return "redirect:/findpwo?pw="+pw;
        }
    }
    
    @GetMapping("/findpwo")
    public String findpwo(
        @RequestParam("pw") String pw,
        Model model
    ){
        model.addAttribute("pw", pw);
        return "/html/findpwo";
    }
}

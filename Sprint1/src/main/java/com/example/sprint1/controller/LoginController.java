package com.example.sprint1.controller;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Stream;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.sprint1.dao.SprintDao;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller

public class LoginController extends HttpServlet {
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
            return "redirect:/main";
        }
    }
    // 로그아웃
    @PostMapping("/main")
    public String logout(
        HttpSession session
    ) {
        session.invalidate();
        return "redirect:/main";
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
            return "redirect:/login";
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

    @GetMapping("/main")
    public String Main(
        Model model
    ) {
        List<Map<String,Object>> tire = sprintDao.selectAll();
        model.addAttribute("tire", tire);
        return "/html/main";
    }

    @GetMapping("/detail")
    public String Detail(
        @RequestParam("seq") String seq,
        @RequestParam(name = "id",required = false) String id,
        @RequestParam(name = "modal",required = false) String modal,
        @RequestParam(name = "qty",required = false) String qty,
        Model model) {
        if (id != null) {
            sprintDao.insertSearchHistory(seq, id);
        }
        Map<String,Object> product = sprintDao.selectProduct(seq).get(0);
        int cnt = Integer.parseInt(sprintDao.countReview(seq).get(0).get("cnt").toString());
        List<Map<String,Object>> review = sprintDao.Review(seq);
        String company = product.get("product_name").toString().split(" ")[0];
        model.addAttribute("product", product);
        model.addAttribute("cnt", cnt);
        model.addAttribute("review", review);
        model.addAttribute("company", company);
        model.addAttribute("modal", modal);
        model.addAttribute("qty", qty);
        return "/html/detail";
    }
    @PostMapping("/detail")
    public String DetailPost(
        @RequestParam(name = "seq",required = false) String seq,
        @RequestParam(name = "qty",required = false) String qty,
        @RequestParam(name = "modal",required = false) String modal,
        @RequestParam(name = "id",required = false) String id
    ) {
        sprintDao.insertCart(seq, id, qty);
        return String.format("redirect:/detail?id=%s&seq=%s&modal=%s&qty=%s",id,seq,modal,qty);
    }
    
    @GetMapping("/cart")
    public String cart(
        @RequestParam("id") String id,
        Model model
    ) {
        int check = Integer.parseInt(sprintDao.selectCartCount(id).get(0).get("cnt").toString());
        if (check < 1) {
            String cart = "empty";
            model.addAttribute("cart", cart);
        } else {
            List<Map<String,Object>> cart = sprintDao.selectCart(id);
            model.addAttribute("cart", cart);
        }
        return "/html/cart";
    }
    @PostMapping("/cart")
    public String cartPost(
        @RequestParam("cart_seq") String cart_seq,
        @RequestParam("id") String id
    ) {
        sprintDao.deleteCart(cart_seq);
        return "redirect:/cart?id="+id;
    }
    
    @GetMapping("/review")
    public String review(
        @RequestParam("seq") String seq,
        Model model
    ) {
        Map<String,Object> tire = sprintDao.selectProduct(seq).get(0);
        model.addAttribute("tire", tire);
        return "/html/review";
    }

    @PostMapping("/review")
    public String reviewPost(
        @RequestParam("id") String id,
        @RequestParam("seq") String seq,
        @RequestParam("content") String content
    ) {
        sprintDao.insertReview(seq, id, content);
        return "redirect:/mypage?id="+id;
    }

    @GetMapping("/searchlist")
    public String searchlist(
        @RequestParam(name = "hankook", required= false) String[] hankook,
        @RequestParam(name = "kumho", required= false) String[] kumho,
        @RequestParam(name = "nexen", required= false) String[] nexen,
        @RequestParam(name = "michelin", required= false) String[] michelin,
        @RequestParam(name = "continental", required= false) String[] continental,
        @RequestParam(name = "pcar", required= false) String[] pcar,
        @RequestParam(name = "suvcar", required= false) String[] suvcar,
        @RequestParam(name = "comfort", required= false) String[] comfort,
        @RequestParam(name = "sports", required= false) String[] sports,
        @RequestParam(name = "lownoise", required= false) String[] lownoise,
        @RequestParam(name = "125", required= false) String[] m125,
        @RequestParam(name = "205", required= false) String[] m205,
        @RequestParam(name = "215", required= false) String[] m215,
        @RequestParam(name = "225", required= false) String[] m225,
        @RequestParam(name = "235", required= false) String[] m235,
        @RequestParam(name = "245", required= false) String[] m245,
        @RequestParam(name = "255", required= false) String[] m255,
        @RequestParam(name = "265", required= false) String[] m265,
        @RequestParam(name = "275", required= false) String[] m275,
        @RequestParam(name = "285", required= false) String[] m285,
        @RequestParam(name = "305", required= false) String[] m305,
        @RequestParam(name = "30per", required= false) String[] per30,
        @RequestParam(name = "35per", required= false) String[] per35,
        @RequestParam(name = "40per", required= false) String[] per40,
        @RequestParam(name = "45per", required= false) String[] per45,
        @RequestParam(name = "50per", required= false) String[] per50,
        @RequestParam(name = "55per", required= false) String[] per55,
        @RequestParam(name = "60per", required= false) String[] per60,
        @RequestParam(name = "80per", required= false) String[] per80,
        @RequestParam(name = "13inch", required= false) String[] inch13,
        @RequestParam(name = "16inch", required= false) String[] inch16,
        @RequestParam(name = "17inch", required= false) String[] inch17,
        @RequestParam(name = "18inch", required= false) String[] inch18,
        @RequestParam(name = "19inch", required= false) String[] inch19,
        @RequestParam(name = "20inch", required= false) String[] inch20,
        @RequestParam(name = "21inch", required= false) String[] inch21,
        @RequestParam(name = "22inch", required= false) String[] inch22,
        Model model
    ) {
        if (suvcar != null) {
            suvcar = new String[]{"SUV, RV용"};
        }
        String[] allManufacturers = Stream.of(hankook, kumho, nexen, michelin, continental)
                .filter(Objects::nonNull)
                .flatMap(Arrays::stream)
                .toArray(String[]::new);
        String[] carTypes = Stream.of(pcar, suvcar)
                .filter(Objects::nonNull)
                .flatMap(Arrays::stream)
                .toArray(String[]::new);
        String[] tireChar = Stream.of(comfort, sports)
                .filter(Objects::nonNull)
                .flatMap(Arrays::stream)
                .toArray(String[]::new);
        String[] width = Stream.of(m125, m205, m215, m225, m235, m245, m255, m265, m275, m285, m305)
                .filter(Objects::nonNull)
                .flatMap(Arrays::stream)
                .toArray(String[]::new);
        String[] ratio = Stream.of(per30, per35, per40, per45, per50, per55, per60, per80)
                .filter(Objects::nonNull)
                .flatMap(Arrays::stream)
                .toArray(String[]::new);
        String[] inch = Stream.of(inch13, inch16, inch17, inch18, inch19, inch20, inch21, inch22)
                .filter(Objects::nonNull)
                .flatMap(Arrays::stream)
                .toArray(String[]::new);

        List<Map<String, Object>> tireList = sprintDao.searchTires(
                allManufacturers, carTypes, tireChar, lownoise, width, ratio, inch
        );
        model.addAttribute("tire", tireList);

        return "/html/searchlist";
    }

    @GetMapping("/mypage")
    public String mypage(
        @RequestParam("id") String id,
        Model model
    ) {
        List<Map<String,Object>> purchase = sprintDao.selectPurchaseHistory(id);
        List<Map<String,Object>> review = sprintDao.selectReview(id);
        List<Map<String,Object>> search = sprintDao.selectSearchHistory(id);
        model.addAttribute("purchase", purchase);
        model.addAttribute("review", review);
        model.addAttribute("search", search);
        return "/html/mypage";
    }

    @PostMapping("/mypage")
    public String mypagePost(
        @RequestParam(name ="pw",required = false) String pw,
        @RequestParam(name = "name",required = false) String name,
        @RequestParam(name = "phonenum",required = false) String phonenum,
        @RequestParam(name = "email",required = false) String email,
        @RequestParam(name = "id",required = false) String id,
        @RequestParam(name = "review_seq",required = false) String review_seq,
        @RequestParam(name = "search_seq",required = false) String search_seq,
        HttpSession session
    ) {
        if (pw != null && name != null && phonenum != null && email != null) {
            sprintDao.updateUser(pw, name, phonenum, email, id);
            Map<String,Object> user = sprintDao.login(id,pw).get(0);
            session.setAttribute("user", user);
        }
        if (review_seq != null) {
            sprintDao.deleteReview(review_seq);
        }
        if (search_seq != null) {
            sprintDao.deleteSearchHistory(search_seq);
        }
        return "redirect:/mypage?id="+id;
    }
    @GetMapping("/product")
    public String product(
        @RequestParam(name = "seq",required = false) String seq,
        @RequestParam(name = "qty",required = false) String qty,
        @RequestParam(name = "detail",required = false) String detail,
        @RequestParam(name = "modal",required = false) String modal,
        @RequestParam(name = "cart",required = false) String cart,
        @RequestParam(name = "id",required = false) String id,
        @RequestParam(name = "size",required = false) String size,
        Model model
    ) {
        if (size != null) {
            List<Map<String,Object>> cartlist = sprintDao.selectPurchaseHistoryProduct(id, size);
            model.addAttribute("cartlist", cartlist);
            model.addAttribute("size",size);
            model.addAttribute("modal", modal);
        } else if (detail != null) {
            Map<String,Object> product = sprintDao.selectProduct(seq).get(0);
            model.addAttribute("detail",detail);
            model.addAttribute("qty",qty);
            model.addAttribute("product", product);
            model.addAttribute("modal", modal);
        } else if (cart != null) {
            List<Map<String,Object>> cartlist = sprintDao.selectCart(id);
            model.addAttribute("cartlist", cartlist);
            model.addAttribute("cart", cart);
            model.addAttribute("modal", modal);
        }
        return "/html/product";
    }

    @PostMapping("/product")
    public String productPost (
        @RequestParam(name = "seq",required = false) String seq,
        @RequestParam(name = "qty",required = false) String qty,
        @RequestParam(name = "detail",required = false) String detail,
        @RequestParam(name = "modal",required = false) String modal,
        @RequestParam(name = "id",required = false) String id,
        @RequestParam(name = "cartsize",required = false) String cartsize,
        @RequestParam(name = "cart", required = false) String cart,
        HttpServletRequest request
    ) {
        if (detail != null) {
            sprintDao.insertPurchaseHistory(seq, id, qty);
            return String.format("redirect:/product?seq=%s&qty=%s&detail=%s&modal=%s&size=%s",seq,qty,detail,modal,cartsize);
        }
        
        if (cart != null) {
            int cartsize1 = Integer.parseInt(cartsize);
            for (int j = 0; j < cartsize1; j++) {
                String cartseq = request.getParameter(String.format("seq%s",j));
                String cartqty = request.getParameter(String.format("qty%s",j));
                sprintDao.insertPurchaseHistory(cartseq, id, cartqty);
                sprintDao.deleteCartByPurchase(id);
            }
        }
        return String.format("redirect:/product?size=%s&modal=%s&id=%s",cartsize,modal,id );
    }
}

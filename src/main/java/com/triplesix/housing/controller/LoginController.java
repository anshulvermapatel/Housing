package com.triplesix.housing.controller;


import com.triplesix.housing.dao.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {

    @Autowired
    private LoginDAO loginDAO;

    @RequestMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping("/login_admin")
    public String showAdminLoginPage() {
        return "login_admin";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            c.setMaxAge(0);
            response.addCookie(c);
        }

        return "redirect:/";
    }

    @RequestMapping("/login_process")
    public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model) {

        // get parameters from form
        String as = request.getParameter("as");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String[] remember = request.getParameterValues("remember");

        // get result from dao
        Integer loginResult = loginDAO.checkLogin(as, username, password);

        if (loginResult > 0) { // correct username and password
            Cookie idCookie = new Cookie("id", loginResult.toString());
            Cookie asCookie = new Cookie("as", as);

            // remember me for one day or current session life
            if (remember != null) {
                idCookie.setMaxAge(24 * 60 * 60);
                asCookie.setMaxAge(24 * 60 * 60);
            } else {
                idCookie.setMaxAge(-1);
                asCookie.setMaxAge(-1);
            }

            response.addCookie(idCookie);
            response.addCookie(asCookie);

            if (as.equals("Student")) {
                return "redirect:/";
            } else {
                return "redirect:/landlord";
            }
        } else { // wrong username or password
            model.addAttribute("loginResult", false);
            return "login_error";
        }
    }
}


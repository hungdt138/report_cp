/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crm.controller;

import com.crm.kernel.message.Constants;
import com.crm.user.bean.UserEntry;
import com.crm.user.impl.UserImpl;
import com.crm.util.StringUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author hungdt
 */
public class LoginController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ModelAndView mv = new ModelAndView("login");
        String username = StringUtil.getRightString(req.getParameter("u"));
        String password = StringUtil.getRightString(req.getParameter("p"));

        String error = "";

        UserEntry u = null;

        if (!"".equals(username) && !"".equals(password)) {
            try {
                u = UserImpl.checkLogin(username, password);
            } catch (Exception e) {
                error = "Hệ thống bận, vui lòng đăng nhập lại.";
                return mv;
            }

            System.out.println("User login: " + username + "|" + password + "|" + req.getRemoteAddr());

            if (u == null) {
                error = "Sai tên đăng nhập hoặc mật khẩu.";
            }
        }

        if (u != null) {
            UserImpl.updateLogin(req.getRemoteAddr(), u.getUserId());
            req.getSession().setAttribute("user", u);
            req.getSession().setAttribute("logined", true);
            if (u.getRoleName().equals(Constants.ROLE_TELCO)) {
                resp.sendRedirect("cskh.do");
            } else {
                resp.sendRedirect("index.do");
            }

        }

        mv.addObject("error", error);
        return mv;
    }

}

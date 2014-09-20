/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.crm.controller;

import com.crm.subscriber.bean.SubBean;
import com.crm.subscriber.bean.SubscriberCountBean;
import com.crm.subscriber.imp.SubscriberOrderImpl;
import com.crm.subscriber.imp.SubscriberProductImpl;
import com.crm.user.bean.UserEntry;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author hungdt
 */
public class IndexController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ModelAndView mv = new ModelAndView("index");

        if (req.getSession().getAttribute("logined") == null) {
            System.out.println("Chua dang nhap");
            resp.sendRedirect(req.getContextPath() + "/login.do");
            return null;
        }

        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("login.do");
            return null;
        }

        UserEntry u = (UserEntry) req.getSession().getAttribute("user");

        long merchantId = 0;
        if (u.getMerchantId() != 0) {
            merchantId = u.getMerchantId();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        SimpleDateFormat sdf1 = new SimpleDateFormat("MM");
        SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy");

        Calendar cal = Calendar.getInstance();

        String startMonth = sdf1.format(cal.getTime()) + "/01/" + sdf.format(cal.getTime());
        String endMonth = sdf2.format(cal.getTime());

        //Get list date
        List<String> lstDate = new ArrayList<String>();

        //get CCU Mobifone
        List<SubBean> lst1 = SubscriberOrderImpl.getAllSubActive(merchantId, 1, startMonth, endMonth, "");

        List<String> lstMobifone = new ArrayList<String>();

        for (SubBean s : lst1) {
            lstDate.add("'"+ s.getDateTime()+"'");
            lstMobifone.add(String.valueOf(s.getSubActive()));
        }

        //vina
        List<SubBean> lst2 = SubscriberOrderImpl.getAllSubActive(merchantId, 2, startMonth, endMonth, "");
        List<String> lstVinaphone = new ArrayList<String>();
        for (SubBean s : lst2) {
            lstVinaphone.add(String.valueOf(s.getSubActive()));
        }

        //Viettel
        List<SubBean> lst3 = SubscriberOrderImpl.getAllSubActive(merchantId, 3, startMonth, endMonth, "");

        List<String> lstViettel = new ArrayList<String>();
        for (SubBean s : lst3) {
            lstViettel.add(String.valueOf(s.getSubActive()));
        }
        //Vietnamobile
        List<SubBean> lst4 = SubscriberOrderImpl.getAllSubActive(merchantId, 4, startMonth, endMonth, "");
        List<String> lstVNM = new ArrayList<String>();
        for (SubBean s : lst4) {
            lstVNM.add(String.valueOf(s.getSubActive()));
        }

        int allSubMobi = SubscriberProductImpl.countAllSub(1);
        int allSubVina = SubscriberProductImpl.countAllSub(2);
        int allSubVt = SubscriberProductImpl.countAllSub(3);
        int allSubVnm = SubscriberProductImpl.countAllSub(4);

        mv.addObject("allSubMobi", allSubMobi);
        mv.addObject("allSubVina", allSubVina);
        mv.addObject("allSubVt", allSubVt);
        mv.addObject("allSubVnm", allSubVnm);

        mv.addObject("username", u.getScreenName());
        mv.addObject("role", u.getRoleName());
        mv.addObject("lstMobifone", lstMobifone);
        mv.addObject("lstVinaphone", lstVinaphone);
        mv.addObject("lstViettel", lstViettel);
        mv.addObject("lstVNM", lstVNM);
        mv.addObject("lstDate", lstDate);
        return mv;
    }
}

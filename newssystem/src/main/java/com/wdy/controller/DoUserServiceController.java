package com.wdy.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wdy.domain.User;
import com.wdy.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class DoUserServiceController {

    @Resource
    private UserService userService;

    @RequestMapping("dologin")
    public void doLogin(String username, String password1, HttpServletRequest request, HttpServletResponse response) throws IOException {

        User user = null;

        user = userService.findUser(username, password1);
        PrintWriter writer = response.getWriter();
        if(user!=null){
            request.getSession().setAttribute("user",user);
            writer.print(0);
        }
        else{
                writer.print(1);
        }
    }

    @RequestMapping("doregister")
    public void doRegister(String username,String password1,String password3,HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        User user = null;
        user = userService.testUser(username);
        if(user!=null){
            writer.print(1);
        }
        else if(!password1.equals(password3)){
            writer.print(2);
        }
        else{
            userService.addUser(username,password1);
             writer.print(0);
        }
    }

    @RequestMapping("showuserlist")
    public String doUserList(HttpServletRequest request,@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn){
        List<User> list = null;
        PageHelper.startPage(pn,5);
        list = userService.findAllCommonUser();
        PageInfo pageInfo = new PageInfo(list,5);
        request.getSession().setAttribute("pageInfo",pageInfo);
        return "userlist";
    }

    @RequestMapping("doback")
    public void doBack(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.getWriter().print(0);
    }


    @RequestMapping("douserdelete")
    public void doUserDelete(int userid,HttpServletResponse response,HttpServletRequest request) throws IOException {
        int result = 0;
        result = userService.deleteUser(userid);
        PrintWriter writer = response.getWriter();
        if(result>0){
            if(((User)request.getSession().getAttribute("user")).getUserid()==userid){
                request.getSession().invalidate();
            }
            writer.print(true);
        }
        else{
            writer.print(false);
        }
        writer.flush();
        writer.close();
    }

    @RequestMapping("dochangepassword")
    public void doChangePassword(int userid,String password,HttpServletResponse response,HttpServletRequest request) throws IOException {
        int result = 0;
        result = userService.updatePassword(password,userid);
        PrintWriter writer = response.getWriter();
        if(result>0){
            request.getSession().invalidate();
            writer.print(true);
        }
        else{
            writer.print(false);
        }
        writer.flush();
        writer.close();
    }

    @RequestMapping("doaddlevel")
    public void doAddLevel(int userid,HttpServletResponse response) throws IOException {
        int result = 0;
        result = userService.updateUserLevel(userid);
        PrintWriter writer = response.getWriter();
        if(result>0){
            writer.print(true);
        }
        else{
            writer.print(false);
        }
        writer.flush();
        writer.close();
    }
}

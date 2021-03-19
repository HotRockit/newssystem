package com.wdy.controller;


import com.wdy.domain.News;
import com.wdy.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ServiceController {

    @Resource
    NewsService newsService;

    @RequestMapping("login")
    public ModelAndView toLogin(String redirectURL){

        ModelAndView mv = new ModelAndView();
        mv.addObject("url",redirectURL);
        mv.setViewName("login");
        return mv;
    }
//    public String toLogin(){
//        return "login";
//    }

    @RequestMapping("index")
    public String toMain(Model model){
        List<News> list = null;
        list = newsService.findAllNewsByState("yes", "全部");
        if(list.size()>8){
           list = list.subList(0,8);
        }
        model.addAttribute("newslist",list);
        return "index";
    }

    @RequestMapping("newslist")
    public String toNewsList(){
        return "newslist";
    }

    @RequestMapping("newsupload")
    public String toNewsUpload(){
        return "newsupload";
    }

    @RequestMapping("userlist")
    public String toUserList(){
        return "userlist";
    }

    @RequestMapping("register")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("useredit")
    public String toUserEdit(){
        return "useredit";
    }

    @RequestMapping("tonumber")
    public String toFindNumber(){
        return "mobilenumber";
    }
    @RequestMapping("toweather")
    public String toFindWeather(){
        return "weather";
    }
}

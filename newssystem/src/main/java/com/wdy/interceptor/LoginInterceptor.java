package com.wdy.interceptor;


import com.wdy.domain.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;


public class LoginInterceptor extends HandlerInterceptorAdapter {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        if(user!=null){
            return true;
        }
        else{
            String url = request.getServletPath().toString();
            url = url.substring(1);
            request.getRequestDispatcher("/login.do?redirectURL="
                    + URLEncoder.encode(url)).forward(request, response);
            return false;
        }
    }
}

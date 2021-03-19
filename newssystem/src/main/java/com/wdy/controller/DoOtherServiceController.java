package com.wdy.controller;


import com.wdy.mobile.MobileCodeWS;
import com.wdy.weather.ArrayOfString;
import com.wdy.weather.WeatherWS;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class DoOtherServiceController {

    @Resource
    MobileCodeWS mobileCodeWS;
    @Resource
    WeatherWS weatherWS;

    @RequestMapping("dofindphone")
    public void doFindPhone(String number, HttpServletResponse response) throws IOException {
        String mobileCodeInfo = mobileCodeWS.getMobileCodeWSSoap().getMobileCodeInfo(number, "");
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(mobileCodeInfo);
    }

    @RequestMapping("dofindweather")
    public void doFindWeather(String city,HttpServletResponse  response) throws IOException {
        ArrayOfString weather = weatherWS.getWeatherWSSoap().getWeather(city, "");
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(weather.getString().toString());
    }
}

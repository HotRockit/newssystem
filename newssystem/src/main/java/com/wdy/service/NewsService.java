package com.wdy.service;


import com.wdy.domain.News;

import java.util.List;

public interface NewsService {

     News findNews(int newsid);
     int addNews(String newstitle,String newsauthor,String newsdate,String newsfile,String newsstate,String newstype);
     List<News> findAllNewsByState(String newsstate, String newstype);
     List<News> findAllNews(String newstype);
     int deleteNews(int newsid);
     int updateNews(int newsid);

     int count(String newsstate, String newstype);
}

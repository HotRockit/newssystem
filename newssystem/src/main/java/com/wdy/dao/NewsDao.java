package com.wdy.dao;

import com.wdy.domain.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsDao {
     News findNews(@Param("newsid") int newsid);
     int addNews(@Param("newstitle") String newstitle,@Param("newsauthor") String newsauthor,@Param("newsdate") String newsdate,@Param("newsfile") String newsfile,@Param("newsstate") String newsstate,@Param("newstype") String newstype);
     List<News> findAllNewsByState(@Param("newsstate") String newsstate,@Param("newstype") String newstype);
     List<News> findAllNews(@Param("newstype") String newstype);
     int deleteNews(@Param("newsid") int newsid);
     int updateNews(@Param("newsid") int newsid);

     int count(@Param("newsstate") String newsstate,@Param("newstype") String newstype);
}

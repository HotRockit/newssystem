package com.wdy.service.impl;

import com.wdy.dao.NewsDao;
import com.wdy.domain.News;
import com.wdy.service.NewsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class NewsServiceImpl implements NewsService {

    @Resource
    NewsDao newsDao;
    @Override
    public News findNews(int newsid) {
        return newsDao.findNews(newsid);
    }

    @Override
    public int addNews(String newstitle, String newsauthor, String newsdate, String newsfile, String newsstate,String newstype) {
        return newsDao.addNews(newstitle,newsauthor,newsdate,newsfile,newsstate,newstype);
    }

    @Override
    public List<News> findAllNewsByState(String newsstate, String newstype) {
        return newsDao.findAllNewsByState(newsstate,newstype);
    }

    @Override
    public List<News> findAllNews(String newstype) {
        return newsDao.findAllNews(newstype);
    }

    @Override
    public int deleteNews(int newsid) {
        return newsDao.deleteNews(newsid);
    }

    @Override
    public int updateNews(int newsid) {
        return newsDao.updateNews(newsid);
    }

    @Override
    public int count(String newsstate, String newstype) {
        return newsDao.count(newsstate,newstype);
    }
}

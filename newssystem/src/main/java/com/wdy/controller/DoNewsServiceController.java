package com.wdy.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wdy.domain.News;
import com.wdy.domain.User;
import com.wdy.service.NewsService;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import utils.SimpleSummariserAlgorithm;
import utils.ToString;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;


@Controller
public class DoNewsServiceController{
    @Resource
    NewsService newsService;

    @RequestMapping("doupload")
    public void doUpLoad(MultipartFile newsfile, HttpServletRequest request,HttpServletResponse response,String newstitle,String newsauthor,String newsdate,String newstype) throws IOException {
        int result = 0;
        PrintWriter writer = response.getWriter();
        if(newsfile.getSize()>0 && !newstype.equals("") && !newsauthor.equals("")){
            String filename = newsfile.getOriginalFilename();
            filename = UUID.randomUUID().toString()+filename;
            if(filename.endsWith("txt")){
//              String leftpath = request.getServletContext().getRealPath("/upload");
                String leftpath = "/home/wdy/IntelliJIDEAProjects/webapp/upload";
                File file = new File(leftpath,filename);
                if (!file.getParentFile().exists()){
                    file.getParentFile().mkdirs();
                }
                newsfile.transferTo(file);
                String s = ToString.readCityFile(file);
                String summarise = SimpleSummariserAlgorithm.summarise(s, 3);
                File file1 = new File(leftpath,"summary"+filename);
                FileWriter fileWriter = new FileWriter(file1);
                fileWriter.write(summarise);
                fileWriter.close();
                String newsstate = null;
                User user = null;
                user = (User) request.getSession().getAttribute("user");
                if(user.getUserlevel()==0){
                    newsstate = "yes";
                }
                else{
                    newsstate = "no";
                }
                result = newsService.addNews(newstitle, newsauthor, newsdate, filename, newsstate,newstype);
            }
        }
        if(result==0){
            writer.print(0);
        }
        else{
            writer.print(1);
        }
    }


    @RequestMapping("dodownload")
    public ResponseEntity<byte[]> doDownLoad(HttpServletRequest request,int newsid) throws IOException {
        News news = newsService.findNews(newsid);
//        String leftpath = request.getServletContext().getRealPath("/upload");
        String leftpath = "/home/wdy/IntelliJIDEAProjects/webapp/upload";
        File file = new File(leftpath,news.getNewsfile());
        if (!file.getParentFile().exists()){
            file.getParentFile().mkdirs();
        }
        HttpHeaders headers = new HttpHeaders();
        String downloadfilename = new String((news.getNewsfile()+"download").getBytes("utf-8"),"iso-8859-1");
        headers.setContentDispositionFormData("attachment",downloadfilename);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return  new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }

    @RequestMapping("shownewslist")
    public String showNewsList(HttpServletRequest request,String newstype,@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn){
        User user = null;
        List<News> list = null;
        PageHelper.startPage(pn,5);
        request.getSession().setAttribute("newstype",newstype);
        user = (User) request.getSession().getAttribute("user");
        if(user==null || user.getUserlevel()==1){
            list = newsService.findAllNewsByState("yes",newstype);
            PageInfo pageInfo = new PageInfo(list,5);
            request.getSession().setAttribute("pageInfo",pageInfo);
        }
        else{
            list = newsService.findAllNews(newstype);
            PageInfo pageInfo = new PageInfo(list,5);
            request.getSession().setAttribute("pageInfo",pageInfo);
        }
        return "newslist";
    }

    @RequestMapping("shownewsdetail")
    public String showNewsDetail(String newsfile,String newstitle,String newsauthor,String newsdate, HttpServletRequest request, Model model){
//        String leftpath = request.getServletContext().getRealPath("/upload");
        String leftpath = "/home/wdy/IntelliJIDEAProjects/webapp/upload";
        File file = new File(leftpath,newsfile);
        File file1 = new File(leftpath,"summary"+newsfile);
        model.addAttribute("file",file);
        model.addAttribute("file1",file1);
        model.addAttribute("newstitle",newstitle);
        model.addAttribute("newsauthor",newsauthor);
        model.addAttribute("newsdate",newsdate);

        return "newsitem";
    }


    @RequestMapping("dodelete")
    public void doDelete(int newsid, HttpServletResponse response) throws IOException {
        int result = 0;
        PrintWriter writer = response.getWriter();
        News news = newsService.findNews(newsid);
        result = newsService.deleteNews(newsid);
        if(result>0){
            String leftpath = "/home/wdy/IntelliJIDEAProjects/webapp/upload";
            File file = new File(leftpath,news.getNewsfile());
            file.delete();
            writer.print(true);
        }
        else{
            writer.print(false);
        }
    }

    @RequestMapping("dotest")
    public void doTest(int newsid,HttpServletResponse response) throws IOException {
        int result = 0;
        PrintWriter writer = response.getWriter();
        result = newsService.updateNews(newsid);
         if(result>0){
             writer.print(true);
         }
         else {
             writer.print(false);
         }
    }

    @RequestMapping("shownewsreport")
    public String doNewsReport(Model model){
        String[] array = {"全部","时政","军事","娱乐","科技","人文","体育"};
        Integer[] array2 = new Integer[7];
        Float[] array3 = new Float[6];
        for(int i=0;i<array.length;i++){
            array2[i] = newsService.count("yes",array[i]);
        }
        DecimalFormat df = new DecimalFormat("0.000");
        for(int i=0;i<5;i++){
            array3[i] = Float.valueOf(df.format((float)array2[i+1]/array2[0]));
        }
        array3[5]=(float)1.0;
        for(int i=0;i<5;i++){
            array3[5] = Float.valueOf(df.format(array3[5]-array3[i]));
        }

        model.addAttribute("array",array3);

        return "newsreport";
    }
}

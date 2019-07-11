package com.neusoft.web.impl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.FileUtil;
import basic.LogicException;

import java.io.IOException;
import java.util.List;

@WebServlet("/upload")
public class UploadServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        try 
        {
            List<String> imgList=FileUtil.upload(req);
            for(String imgpath:imgList)
            System.out.println(imgpath);
            
        }
        catch (LogicException e)
        {
            //�õ����ǵ�LogicException�쳣��Ϣ
            String Msg=e.getMessage();
            req.setAttribute("errorMsg",Msg);
        }
        req.getRequestDispatcher("/test.jsp").forward(req,resp);
    }

}
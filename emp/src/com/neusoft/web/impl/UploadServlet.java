package com.neusoft.web.impl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.FileUtil;
import basic.LogicException;

import java.io.IOException;

@WebServlet("/upload")
public class UploadServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            FileUtil.upload(req);
        }catch (LogicException e){
            //�õ����ǵ�LogicException�쳣��Ϣ
            String Msg=e.getMessage();
            req.setAttribute("errorMsg",Msg);
            req.getRequestDispatcher("/input.jsp").forward(req,resp);
        }

    }

}
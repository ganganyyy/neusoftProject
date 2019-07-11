package com.neusoft.web.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.Ac01ServicesImpl;
import com.neusoft.system.tools.Tools;

import basic.FileUtil;

@WebServlet("/upreci")
public class UpreciServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
        {
			Map<String,Object> dto=FileUtil.upload(request);
            List<String> imageList = (List<String>) dto.get("imageList");
            System.out.println(dto);
            String aac108=imageList.get(0);
            System.out.println(aac108);
            String ins;
            for(int i=1;i<imageList.size();i++)
            {
            	ins=imageList.get(i);
            	System.out.println(ins);
            }
            Ac01ServicesImpl service=new Ac01ServicesImpl();
            service.addReci(dto,aac108);
            System.out.println("000000000");
        }
        catch (Exception e)
        {
            //拿到我们的Exception异常信息
            String Msg=e.getMessage();
            request.setAttribute("errorMsg",Msg);
        }
        request.getRequestDispatcher("/test.jsp").forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        this.doGet(request, response);
	}

}

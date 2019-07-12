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
            
            String aac108=imageList.get(0);
            dto.put("aac108", aac108);
            
            Ac01ServicesImpl service=new Ac01ServicesImpl();
            service.addReci(dto);
            
            int aac101=Tools.getSequence("aac101");
            dto.put("aac101", aac101);
            
            String ings=(String)dto.get("ingsNum");
            int j=Integer.parseInt(ings);
            
            for(int i=1;i<j+1;i++)
            {
            	service.addInsg(dto,i);
            }
            
            String aac403;
            for(int i=1;i<imageList.size();i++)
            {
            	aac403=imageList.get(i);
            	dto.put("aac403", aac403);
            	service.addStep(dto,i);
            }
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

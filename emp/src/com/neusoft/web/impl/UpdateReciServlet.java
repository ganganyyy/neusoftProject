//author:董淑媛
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
import com.neusoft.web.support.ControllerSupport;

import basic.FileUtil;

@WebServlet("/updateReci")
public class UpdateReciServlet extends HttpServlet {
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
            service.updateReci(dto);
            
            String ings=(String)dto.get("ingsNum");
            int j=Integer.parseInt(ings);
            String aac601count=(String)dto.get("aac601count");
            int aac601num=Integer.parseInt(aac601count);
        	for(int i=1;i<aac601num+1;i++)
            {
            	service.updateInsg(dto,i);
            }
        	for(int i=aac601num+1;i<j+1;i++)
            {
            	service.addInsg(dto,i);
            }
        	String aac401count=(String)dto.get("aac401count");
            int aac401num=Integer.parseInt(aac401count);
            String aac403;
	    	for(int x=1;x<aac401num+1;x++)
	    	{
	    		aac403=imageList.get(x);
	    		dto.put("aac403", aac403);
	    		service.updateStep(dto,x);
	    	}
	    	for(int x=aac401num+1;x<imageList.size();x++)
	        {
	    		aac403=imageList.get(x);
	    		dto.put("aac403", aac403);
	        	service.addStep(dto,x);
	        }
        }
        catch (Exception e)
        {
            //拿到我们的Exception异常信息
            String Msg=e.getMessage();
            request.setAttribute("errorMsg",Msg);
        }
        request.getRequestDispatcher("/mainPage.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        this.doGet(request, response);
	}

}

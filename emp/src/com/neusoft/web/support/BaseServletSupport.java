package com.neusoft.web.support;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.system.tools.Tools;


public abstract class BaseServletSupport extends HttpServlet {
	
  

	
	protected  final void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String toPath=null;
		try
		{
			Map<String, Object> dto=Tools.createDto(request);
			toPath=this.execute(request, dto);
		} 
		catch (Exception ex) 
		{
          request.setAttribute("msg", "Õ¯¬Áπ ’œ");
           ex.printStackTrace();
		}
		request.getRequestDispatcher("/"+toPath+".jsp").forward(request, response);
		
	}

	protected abstract String execute(HttpServletRequest request,Map<String, Object> dto)throws Exception;
	
	
	private void addAab101(Map<String,Object>dto,HttpSession session)
	{
		dto.put("aab101Self", session.getAttribute("aab101Self"));
		dto.put("aab105Self", session.getAttribute("aab101Self"));
	}
	  
	protected final void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		this.doGet(request, response);
	}

}

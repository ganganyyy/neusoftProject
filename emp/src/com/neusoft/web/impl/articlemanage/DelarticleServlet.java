package com.neusoft.web.impl.articlemanage;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.ThresholdingOutputStream;

import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.system.tools.Tools;


@WebServlet("/delarticle.html")
public class DelarticleServlet extends HttpServlet {
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Map<String, Object> dto=Tools.createDto(request);
			articlemanageservicesimpl services =new articlemanageservicesimpl(dto);
			String msg=services.batchDelete()?"É¾³ý³É¹¦":"É¾³ýÊ§°Ü";
			request.setAttribute("msg", msg);
			List<Map<String, String>> rows=services.query();
			if(rows.size()>0)
			{
				request.setAttribute("rows", rows);
			}
		}
		catch (Exception ex)
		{
			request.setAttribute("msg", "ÍøÂç¹ÊÕÏ");
			ex.printStackTrace();
		}
		
		request.getRequestDispatcher("/articlemanage.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		this.doGet(request, response);
	}

}

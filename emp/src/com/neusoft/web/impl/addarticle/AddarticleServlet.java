package com.neusoft.web.impl.addarticle;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.Tool;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.impl.addarticleservicesimpl;
import com.neusoft.system.tools.Tools;


@WebServlet("/addarticle.html")
public class AddarticleServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			Map<String, Object> dto=Tools.createDto(request);
			dto.put("aab101Self", request.getSession().getAttribute("aab101Self"));
			addarticleservicesimpl services=new  addarticleservicesimpl(dto);
			Map<String, String> rank =services.rank();
			System.out.println(rank);
			String msg=null;
			String is2="02";
			if(rank.get("aab105").equals(is2))						
			msg = services.addarticle()?"ÃÌº”≥…π¶":"ÃÌº” ß∞‹";
					
			request.setAttribute("msg", msg);		
		}
		catch (Exception ex)
         {
			request.setAttribute("msg", "Õ¯¬Áπ ’œ");
			ex.printStackTrace();
		}
		

           request.getRequestDispatcher("/addarticle.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}

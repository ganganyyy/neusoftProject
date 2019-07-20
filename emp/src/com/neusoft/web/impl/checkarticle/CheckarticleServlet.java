package com.neusoft.web.impl.checkarticle;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.services.impl.checkarticleservicesimpl;
import com.neusoft.system.tools.Tools;


@WebServlet("/checkarticle.html")
public class CheckarticleServlet extends HttpServlet {

    public CheckarticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			Map<java.lang.String, Object> dto=Tools.createDto(request);
			checkarticleservicesimpl services =new checkarticleservicesimpl(dto);
			List<Map<java.lang.String, java.lang.String>>rows=services.query();
			if(rows.size()>0)
			{
				request.setAttribute("rows", rows);
			}
			else
			{
				request.setAttribute("msg", "没有符合条件的数据 ");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			
		}
		
		request.getRequestDispatcher("/checkarticle.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		this.doGet(request, response);
	}

}

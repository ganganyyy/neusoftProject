package com.neusoft.web.impl.lookarticle;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.checkarticleservicesimpl;
import com.neusoft.services.impl.lookarticleservicesimpl;
import com.neusoft.system.tools.Tools;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;


@WebServlet("/passarticle.html")
public class PassarticleServlet extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Map<java.lang.String, Object> dto=Tools.createDto(request);
			lookarticleservicesimpl services=new lookarticleservicesimpl(dto);
			checkarticleservicesimpl services2 =new checkarticleservicesimpl(dto);
			String msg=services.passmodifyarticle()?"操作成功，已通过":"操作失败";
			services.addarticle(services.passmodifyarticle());
			services.deleteById(services.passmodifyarticle());
			List<Map<java.lang.String, java.lang.String>>rows=services2.query();
			if(rows!=null)
			{
			request.setAttribute("msg", msg);
			request.setAttribute("rows", rows);
			}
			else
			{
				request.setAttribute("msg", "更新成功，查询失败");
			}
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		request.getRequestDispatcher("/checkarticle.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
		this.doGet(request, response);
	}

}

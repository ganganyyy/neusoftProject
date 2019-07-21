package com.neusoft.web.impl.myarticle;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.myarticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/myarticle.html")
public class MyarticleServlet extends BaseServletSupport {

	
	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		myarticleservicesimpl services =new myarticleservicesimpl(dto);
		dto.put("aab101Self", request.getSession().getAttribute("aab101Self"));
		List<Map<String, String>>rows=services.query();
		if(rows.size()>0)
		{
			request.setAttribute("rows", rows);
		}
		else
		{
			request.setAttribute("msg", "没有查到数据");
		}
		return "myarticle";
	}

}

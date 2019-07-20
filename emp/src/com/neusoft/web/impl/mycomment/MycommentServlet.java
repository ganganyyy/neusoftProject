package com.neusoft.web.impl.mycomment;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.mycommentservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/mycomment.html")
public class MycommentServlet extends BaseServletSupport 
{

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		mycommentservicesimpl services=new mycommentservicesimpl(dto);
		List<Map<String, String>>rows=services.query();
		if(rows.size()>0)
		{
			request.setAttribute("rows", rows);
		}
		else
		{
			request.setAttribute("msg", "没有查到数据");
		}
		
		return "mycomment";
	}

}

package com.neusoft.web.impl.articlemanage;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/articlemanage.html")
public class ArticlemanageServlet extends BaseServletSupport {

	
	
	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		articlemanageservicesimpl services=new articlemanageservicesimpl(dto);
		List<Map<String, String>>rows=services.query();
		if(rows.size()>0)
		{
			request.setAttribute("rows", rows);
		}
		else
		{
			request.setAttribute("msg", "没有查到数据");
		}
		
		return "articlemanage";
	}

}

package com.neusoft.web.impl.browsearticle;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.addarticleservicesimpl;
import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.services.impl.browsearticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/userquery.html")
public class UserqueryServlet extends BaseServletSupport {



	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		
		browsearticleservicesimpl services =new browsearticleservicesimpl(dto);
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
		return "browsearticle";
	}

}

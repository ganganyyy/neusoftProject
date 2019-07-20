package com.neusoft.web.impl.browsearticle;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.browsearticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/browsefindByIdarticle.html")
public class BrowsefindByIdarticleServlet extends BaseServletSupport {
	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		browsearticleservicesimpl services=new browsearticleservicesimpl(dto);
		Map<String,String>ins=services.findById();
		     Map<String, String>ab02=services.ab02();
		     Map<String, String>ad01=services.ad01();
		List<Map<String, String>>comment=services.querycomment();
		request.setAttribute("ab02", ab02);
		request.setAttribute("ad01", ad01);
		request.setAttribute("comment", comment);
		if(ins!=null )
		{
			request.setAttribute("ins", ins);
		}
		else
		{
			request.setAttribute("msg", "数据已删除或禁止访问");
		}	
		return "browsefindByIdarticle";

	}

}

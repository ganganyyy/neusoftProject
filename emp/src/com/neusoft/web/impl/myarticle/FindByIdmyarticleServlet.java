package com.neusoft.web.impl.myarticle;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.findByIdmyarticleservicesimpl;
import com.neusoft.services.impl.myarticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/findByIdmyarticle.html")
public class FindByIdmyarticleServlet extends BaseServletSupport {

	

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		myarticleservicesimpl services=new myarticleservicesimpl(dto);
		Map<String,String>ins=services.findById();
		List<Map<String, String>>comment=services.querycomment();
		request.setAttribute("comment", comment);
		if(ins!=null)
		{
			request.setAttribute("ins", ins);
		}
		else
		{
			request.setAttribute("msg", "数据已删除或禁止访问");
		}
		return "findByIdmyarticle";
	}

}

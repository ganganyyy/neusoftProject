package com.neusoft.web.impl.addarticle;

import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/modifyarticle.html")
public class ModifyarticleServlet extends BaseServletSupport 
{

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		articlemanageservicesimpl  services=new articlemanageservicesimpl(dto);
		String msg=services.modifyarticle()?"更新成功":"更新失败";
		request.setAttribute("msg", msg);
		return "addarticle";
	}

}

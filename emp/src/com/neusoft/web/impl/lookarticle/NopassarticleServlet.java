package com.neusoft.web.impl.lookarticle;

import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.lookarticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;
@WebServlet("/nopassarticle.html")
public class NopassarticleServlet extends BaseServletSupport 
{
	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		lookarticleservicesimpl services = new lookarticleservicesimpl(dto);
		String msg=services.nopassmodifyarticle()?"操作成功，不予通过":"操作失败";
		request.setAttribute("msg", msg);
		return "lookarticle";
	}

}

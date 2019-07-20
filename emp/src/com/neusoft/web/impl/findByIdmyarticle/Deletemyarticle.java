package com.neusoft.web.impl.findByIdmyarticle;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.findByIdmyarticleservicesimpl;
import com.neusoft.services.impl.myarticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/deletemyarticle.html")
public class Deletemyarticle extends BaseServletSupport 
{

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		findByIdmyarticleservicesimpl services =new findByIdmyarticleservicesimpl(dto);
		myarticleservicesimpl services2 =new myarticleservicesimpl(dto);
		String msg= services.deletemyarticle()?"É¾³ý³É¹¦":"É¾³ýÊ§°Ü";
		request.setAttribute("msg", msg);
		List<Map<String, String>> rows=services2.query();
		if(rows!=null)
		{
			request.setAttribute("rows", rows);
		}
		return "myarticle";
	}

}

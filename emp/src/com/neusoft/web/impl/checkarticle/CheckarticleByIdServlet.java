package com.neusoft.web.impl.checkarticle;

import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.services.impl.checkarticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;
@WebServlet("/checkByIdarticle.html")
public class CheckarticleByIdServlet extends BaseServletSupport 
{

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		checkarticleservicesimpl services=new checkarticleservicesimpl(dto);
		Map<String,String>ins=services.findById();
		if(ins!=null)
		{
			request.setAttribute("ins", ins);
		}
		else
		{
			request.setAttribute("msg", "数据已删除或禁止访问");
		}
		return "lookarticle";
	}

}

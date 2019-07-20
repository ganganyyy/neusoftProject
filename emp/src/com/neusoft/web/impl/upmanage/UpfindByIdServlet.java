package com.neusoft.web.impl.upmanage;

import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.checkarticleservicesimpl;
import com.neusoft.services.impl.upmanageservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/upfindById.html")
public class UpfindByIdServlet extends BaseServletSupport {

	
	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		upmanageservicesimpl services=new upmanageservicesimpl(dto);
		Map<String,String>ins=services.findById();
		if(ins!=null)
		{
			request.setAttribute("ins", ins);
		}
		else
		{
			request.setAttribute("msg", "数据已删除或禁止访问");
		}
		return "upfindById";
	}

}

package com.neusoft.web.impl.mycomment;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.mycommentservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/delByIdcomment.html")
public class DelByIdcommentServlet extends BaseServletSupport 
{

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		mycommentservicesimpl services=new mycommentservicesimpl(dto);
		String msg= services.deleteById()?"É¾³ý³É¹¦":"É¾³ýÊ§°Ü";
		request.setAttribute("msg", msg);
		List<Map<String, String>> rows=services.query();
		if(rows!=null)
		{
			request.setAttribute("rows", rows);
		}
		
		return "mycomment";
	}

}

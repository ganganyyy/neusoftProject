package com.neusoft.web.impl.mycomment;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.mycommentservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/delcomment.html")
public class DelcommentServlet extends BaseServletSupport {


	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 	
	{
		mycommentservicesimpl services=new mycommentservicesimpl(dto);
		String msg=services.batchDelete()?"É¾³ý³É¹¦":"É¾³ýÊ§°Ü";
		request.setAttribute("msg", msg);
		List<Map<String, String>> rows=services.query();
		if(rows.size()>0)
		{
			request.setAttribute("rows", rows);
		}
		return "mycomment";
	}

}

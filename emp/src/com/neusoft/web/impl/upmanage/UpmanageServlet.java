package com.neusoft.web.impl.upmanage;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.services.impl.upmanageservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/upmanage.html")
public class UpmanageServlet extends BaseServletSupport {


	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		upmanageservicesimpl services=new upmanageservicesimpl(dto);
		List<Map<String, String>>rows=services.query();
		if(rows.size()>0)
		{
			request.setAttribute("rows", rows);
		}
		else
		{
			request.setAttribute("msg", "û�в鵽����");
		}
		
		return "upmanage";
	}

}

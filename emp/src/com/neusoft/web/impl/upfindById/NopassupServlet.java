package com.neusoft.web.impl.upfindById;

import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.upfindByIdservicesimpl;
import com.neusoft.web.support.BaseServletSupport;


@WebServlet("/nopassup.html")
public class NopassupServlet extends BaseServletSupport {

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		upfindByIdservicesimpl services=new upfindByIdservicesimpl(dto);
		String msg=services.nopassmodify()?"操作成功，不予通过":"操作失败";
		request.setAttribute("msg", msg);
		return "upfindById";
	}

}

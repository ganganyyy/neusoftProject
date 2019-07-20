package com.neusoft.web.impl.upfindById;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.upfindByIdservicesimpl;
import com.neusoft.services.impl.upmanageservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/passup.html")
public class PassupServlet extends BaseServletSupport {

	

	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		upfindByIdservicesimpl services=new upfindByIdservicesimpl(dto);
		upmanageservicesimpl services2 =new upmanageservicesimpl(dto);
		String msg=services.uppassmodify()?"操作成功，已通过":"操作失败";
		services.usermodify();
		services.deleteById();
		List<Map<java.lang.String, java.lang.String>>rows=services2.query();
		if(rows!=null)
		{
		request.setAttribute("msg", msg);
		request.setAttribute("rows", rows);
		}
		else
		{
			request.setAttribute("msg", "更新成功，查询失败");
		}
		
		
		return "upmanage";
	}

}

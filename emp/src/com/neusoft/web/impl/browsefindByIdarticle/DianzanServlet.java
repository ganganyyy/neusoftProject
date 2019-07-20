package com.neusoft.web.impl.browsefindByIdarticle;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.articlemanageservicesimpl;
import com.neusoft.services.impl.browsearticleservicesimpl;
import com.neusoft.services.impl.browsefindByIdarticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;

@WebServlet("/dianzan.html")
public class DianzanServlet extends BaseServletSupport {


	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception
	{
		browsefindByIdarticleservicesimpl  services=new browsefindByIdarticleservicesimpl(dto);
		String msg=services.dianzan()?"点赞成功":"点赞失败";
		services.jiayidianzan();
		browsearticleservicesimpl services2=new browsearticleservicesimpl(dto);
		List<Map<String, String>>comment=services2.querycomment();
		Map<String, String>ab02=services2.ab02();
		Map<String, String>ad01=services2.ad01();
		request.setAttribute("comment", comment);
		request.setAttribute("msg", msg);
		request.setAttribute("ab02", ab02);
		request.setAttribute("ad01", ad01);
		return "browsefindByIdarticle";
	}
}

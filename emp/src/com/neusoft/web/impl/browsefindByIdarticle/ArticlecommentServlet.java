package com.neusoft.web.impl.browsefindByIdarticle;

import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.neusoft.services.impl.addarticleservicesimpl;
import com.neusoft.services.impl.browsearticleservicesimpl;
import com.neusoft.services.impl.browsefindByIdarticleservicesimpl;
import com.neusoft.web.support.BaseServletSupport;


@WebServlet("/articlecomment.html")
public class ArticlecommentServlet extends BaseServletSupport 
{
	@Override
	protected String execute(HttpServletRequest request, Map<String, Object> dto) throws Exception 
	{
		browsefindByIdarticleservicesimpl services=new  browsefindByIdarticleservicesimpl(dto);
		dto.put("aab101Self", request.getSession().getAttribute("aab101Self"));
		String msg = services.addcomment()?"评论成功":"评论失败";
		browsearticleservicesimpl services2=new browsearticleservicesimpl(dto);
		Map<String, String>ab02=services2.ab02();
		Map<String, String>ad01=services2.ad01();
		List<Map<String, String>>comment=services2.querycomment();
		request.setAttribute("comment", comment);
		request.setAttribute("ab02", ab02);
		request.setAttribute("ad01", ad01);
		request.setAttribute("msg", msg);
		return "browsefindByIdarticle";
	}

}

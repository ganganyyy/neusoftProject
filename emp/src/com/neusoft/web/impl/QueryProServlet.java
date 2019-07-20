package com.neusoft.web.impl;

/**
 * 浏览作品
 * @author 韩金利
 */
public final class QueryProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryPro";
	}
}

package com.neusoft.web.impl;

/**
 * �����Ʒ
 * @author ������
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

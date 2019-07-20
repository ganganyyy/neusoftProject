package com.neusoft.web.impl;
/**
 * ËÑË÷Ë­¹Ø×¢ÎÒ
 * @author Îâ¼ÑÉº
 */
public class QuerySubMeServlet extends SubscribeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "whoSubMe";
	}

}

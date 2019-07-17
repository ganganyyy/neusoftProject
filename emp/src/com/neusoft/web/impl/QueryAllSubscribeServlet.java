package com.neusoft.web.impl;

public class QueryAllSubscribeServlet extends SubscribeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "subscribeByMe";
	}

}

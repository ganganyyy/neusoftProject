package com.neusoft.web.impl;

public class QuerySubMeServlet extends SubscribeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "whoSubMe";
	}

}

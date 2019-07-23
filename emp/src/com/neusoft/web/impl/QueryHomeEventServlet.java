package com.neusoft.web.impl;

public class QueryHomeEventServlet extends HomeEventControllerSupport  
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.savePageData();
		return "queryHomeEvent";
	}

}

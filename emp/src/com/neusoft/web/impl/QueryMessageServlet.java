package com.neusoft.web.impl;

public class QueryMessageServlet extends MessageControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.savePageData();
		return "message";
	}

}

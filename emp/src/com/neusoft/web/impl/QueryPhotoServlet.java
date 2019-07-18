package com.neusoft.web.impl;

public class QueryPhotoServlet extends MessageControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "uploadPhoto";
	}

}

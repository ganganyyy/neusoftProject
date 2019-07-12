package com.neusoft.web.impl;

public class DelByIdProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageData();
		return "queryPro";
	}
}

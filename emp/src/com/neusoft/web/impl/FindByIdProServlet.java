package com.neusoft.web.impl;

public class FindByIdProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.showComment();
		return "product";
	}
}

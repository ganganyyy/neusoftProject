package com.neusoft.web.impl;

public class CancleCollServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleCollection", "ȡ������");
		this.savePageInstance();
		return "product";
	}
}

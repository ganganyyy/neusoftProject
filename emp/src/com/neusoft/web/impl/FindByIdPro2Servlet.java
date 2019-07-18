package com.neusoft.web.impl;

public class FindByIdPro2Servlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "modifyPro";
	}
}


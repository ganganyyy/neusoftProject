package com.neusoft.web.impl;

public class DelMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "ÅúÁ¿É¾³ý");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}

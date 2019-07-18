package com.neusoft.web.impl;

public class DelByIdMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ıÏûÏ¢");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}

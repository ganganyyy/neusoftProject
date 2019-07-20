package com.neusoft.web.impl;


public class UpdateMessageServlet extends MessageControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("updateMessage", "²é¿´");
		this.savePageData();
		this.savePageInstance();
		return "message";
	}

}

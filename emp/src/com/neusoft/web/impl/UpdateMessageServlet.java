package com.neusoft.web.impl;


public class UpdateMessageServlet extends MessageControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("updateMessage", "�鿴");
		this.savePageData();
		this.savePageInstance();
		return "message";
	}

}

package com.neusoft.web.impl;

public class DelByIdMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ����Ϣ");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}

package com.neusoft.web.impl;

public class DelMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "����ɾ��");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}

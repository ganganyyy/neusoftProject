package com.neusoft.web.impl;

public class AddComProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComment", "�ϴ�", "�ϴ��ɹ�", "");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		return "product";
	}
}

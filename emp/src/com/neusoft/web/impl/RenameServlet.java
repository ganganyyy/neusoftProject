package com.neusoft.web.impl;

public class RenameServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("rename", "������");
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		return "collection";
	}

}

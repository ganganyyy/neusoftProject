package com.neusoft.web.impl;

public class DelCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteColl", "ɾ��");
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		return "collection";
	}

}

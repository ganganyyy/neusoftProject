package com.neusoft.web.impl;

public class CreAndCollServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("createColl", "����");
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

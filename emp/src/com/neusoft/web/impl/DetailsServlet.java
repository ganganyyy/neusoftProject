package com.neusoft.web.impl;

public class DetailsServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		this.saveSteps();
		return "details";
	}

}

package com.neusoft.web.impl;

public class CancleshoucangReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{		
		this.update("cancleShoucang", "ȡ���ղ�");
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
	    this.savePageInstance();
	    this.saveSteps();
	    return "details";
	}

}

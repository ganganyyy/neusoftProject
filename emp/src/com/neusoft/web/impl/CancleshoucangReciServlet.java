package com.neusoft.web.impl;

public class CancleshoucangReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{		
		this.update("cancleShoucang", "取消收藏");
		this.getInstanceList("queryCollections", "收藏夹", "rows");
	    this.savePageInstance();
	    this.saveSteps();
	    return "details";
	}

}

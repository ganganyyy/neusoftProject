package com.neusoft.web.impl;

public class CancleLikeReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("cancleLike", "ȡ����");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

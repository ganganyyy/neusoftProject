package com.neusoft.web.impl;

public class ShoucangReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("shoucang", "�ղ�");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

package com.neusoft.web.impl;

public class ShoucangReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("shoucang", " ’≤ÿ");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

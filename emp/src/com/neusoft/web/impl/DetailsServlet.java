package com.neusoft.web.impl;

public class DetailsServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.saveSteps();
		
		return "details";
	}

}

package com.neusoft.web.impl;

public class GuanzhuServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("guanzhu", "¹Ø×¢");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

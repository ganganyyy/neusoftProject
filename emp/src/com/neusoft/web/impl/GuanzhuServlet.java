package com.neusoft.web.impl;

public class GuanzhuServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("guanzhu", "��ע");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

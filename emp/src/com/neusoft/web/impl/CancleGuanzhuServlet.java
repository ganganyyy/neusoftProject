package com.neusoft.web.impl;

public class CancleGuanzhuServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("cancleguanzhu", "ȡ��");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

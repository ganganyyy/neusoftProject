package com.neusoft.web.impl;

public class CancleGuanzhuServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("cancleguanzhu", "È¡¹Ø");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

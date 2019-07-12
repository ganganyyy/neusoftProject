package com.neusoft.web.impl;

public class LikeReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("giveLike", "µãÔÞ");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

package com.neusoft.web.impl;

public class CreAndCollServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("createColl", "¥¥Ω®");
		this.getInstanceList("queryCollections", " ’≤ÿº–", "rows");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

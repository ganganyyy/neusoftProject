package com.neusoft.web.impl;



public class QueryPersonalInfoServlet extends PersonalControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.getInstance("findByIdPhoto", "", "photo");
		return "personalInfo";
	}
	

}

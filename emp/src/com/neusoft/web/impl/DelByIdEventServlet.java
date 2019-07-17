package com.neusoft.web.impl;

public class DelByIdEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete();
		return "queryEvent";
	}

}

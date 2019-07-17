package com.neusoft.web.impl;

public class DelCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteColl", "É¾³ý");
		this.getInstanceList("queryCollections", "ÊÕ²Ø¼Ð", "rows");
		return "collection";
	}

}

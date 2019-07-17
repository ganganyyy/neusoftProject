package com.neusoft.web.impl;

public class CreCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("createColl", "ÖØÃüÃû");
		this.getInstanceList("queryCollections", "ÊÕ²Ø¼Ð", "rows");
		return "collection";
	}

}

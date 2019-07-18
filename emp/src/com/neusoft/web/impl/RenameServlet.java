package com.neusoft.web.impl;

public class RenameServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("rename", "ÖØÃüÃû");
		this.getInstanceList("queryCollections", "ÊÕ²Ø¼Ð", "rows");
		return "collection";
	}

}

package com.neusoft.web.impl;

public class CollectServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.getInstanceList("queryCollections", " ’≤ÿº–", "rows");
		return "collection";
	}

}

package com.neusoft.web.impl;

public class CollectionProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("collection", "µãÔÞ");
		this.savePageInstance();
		this.showLikes();
		this.showComment();
		return "product";
	}
}

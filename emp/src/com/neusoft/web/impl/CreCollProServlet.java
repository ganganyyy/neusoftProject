package com.neusoft.web.impl;

public class CreCollProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("createColl", "�ղ�");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		return "product";
	}
}
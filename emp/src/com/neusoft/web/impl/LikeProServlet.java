package com.neusoft.web.impl;

public class LikeProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("giveLike", "µãÔÞ");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

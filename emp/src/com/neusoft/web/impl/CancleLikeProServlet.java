package com.neusoft.web.impl;

public class CancleLikeProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleLike", "ȡ������");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		return "product";
	}
}

package com.neusoft.web.impl;

public class CancleLikeProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleProLike", "ȡ������");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

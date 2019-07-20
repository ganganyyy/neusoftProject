package com.neusoft.web.impl;

public class CollectionProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("collection", "�ղ�");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

package com.neusoft.web.impl;

public class CancleCollProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleCollection", "ȡ���ղ�");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		return "product";
	}
}

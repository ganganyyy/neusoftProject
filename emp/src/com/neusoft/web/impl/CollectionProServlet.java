package com.neusoft.web.impl;

/**
 * 作品收藏
 * @author 韩金利
 */
public class CollectionProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("collection", "收藏");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

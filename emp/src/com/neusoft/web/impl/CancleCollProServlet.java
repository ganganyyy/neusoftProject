package com.neusoft.web.impl;

/**
 * 取消作品收藏
 * @author 韩金利
 */
public class CancleCollProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleCollection", "取消收藏");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

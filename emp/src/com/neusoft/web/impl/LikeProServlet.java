package com.neusoft.web.impl;

/**
 * 作品点赞
 * @author 韩金利
 */
public class LikeProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("giveLike", "点赞");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

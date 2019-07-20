package com.neusoft.web.impl;

/**
 * 取消作品点赞
 * @author 韩金利
 */
public class CancleLikeProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleProLike", "取消点赞");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

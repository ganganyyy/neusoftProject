package com.neusoft.web.impl;

/**
 * 作品评论
 * @author 韩金利
 */
public class AddComProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComment", "上传", "上传成功", "");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}

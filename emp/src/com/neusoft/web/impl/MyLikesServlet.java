package com.neusoft.web.impl;

/**
 * 我的点赞
 * @author 韩金利
 */
public class MyLikesServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.getInstanceList("myReciLikes", "", "reci");
		this.getInstanceList("myProLikes", "", "pro");
		this.getInstanceList("myCompLikes", "", "comp");
		return "queryHomeLike";
	}
}

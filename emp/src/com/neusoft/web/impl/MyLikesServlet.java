package com.neusoft.web.impl;

/**
 * 我的点赞
 * @author 韩金利
 */
public class MyLikesServlet extends LikeControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		
		this.getInstance("findByIdForPhoto","","ins");
		this.getInstanceList("myReciLikes", "", "reci");
		this.getInstanceList("myProLikes", "", "pro");
		this.getInstanceList("myCompLikes", "", "comp");
		return "queryHomeLike";
	}
}

package com.neusoft.web.impl;

/**
 * 管理点赞
 * @author 韩金利
 */
public class CancleLikeServlet extends LikeControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("deleteLikes", "取消点赞");
		this.getInstanceList("myReciLikes", "", "reci");
		this.getInstanceList("myProLikes", "", "pro");
		this.getInstanceList("myCompLikes", "", "comp");
		return "queryHomeLike";
	}
}

//author:董淑媛
package com.neusoft.web.impl;

public class CancleGuanzhuServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("cancleguanzhu", "取关");
		this.savePageInstance();
		this.getInstanceList("queryCollections", "收藏夹", "rows");
		this.getInstanceList("querySteps", "步骤", "rows1");//步骤
		this.getInstanceList("query", "用料", "rows2");//用料
		this.getInstanceList("queryPro", "作品", "rows3");//作品
		this.getInstanceList("queryLike", "点赞", "rows4");//点赞
		this.getInstanceList("queryComment", "评论", "rows5");//评论
		return "details";
	}

}

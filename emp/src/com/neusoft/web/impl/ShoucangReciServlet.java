package com.neusoft.web.impl;

public class ShoucangReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("shoucang", "收藏");
		this.getInstanceList("querySteps", "步骤", "rows1");//步骤
		this.getInstanceList("query", "用料", "rows2");//用料
		this.getInstanceList("queryPro", "作品", "rows3");//作品
		this.getInstanceList("queryLike", "点赞", "rows4");//点赞
		this.getInstanceList("queryComment", "评论", "rows5");//评论
		this.savePageInstance();
		return "details";
	}

}

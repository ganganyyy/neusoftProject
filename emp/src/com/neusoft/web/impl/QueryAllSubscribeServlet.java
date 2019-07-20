package com.neusoft.web.impl;
/**
 * 搜索所有我关注的人
 * @author 吴佳珊
 */
public class QueryAllSubscribeServlet extends SubscribeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "subscribeByMe";
	}

}

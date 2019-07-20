package com.neusoft.web.impl;
/**
 * 用户搜索所有活动
 * @author 吴佳珊
 */
public class QueryAllVoteServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryAllVote";
	}

}

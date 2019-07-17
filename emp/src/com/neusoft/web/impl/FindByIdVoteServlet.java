package com.neusoft.web.impl;

public class FindByIdVoteServlet extends VoteControllerSupport 
{

	/**
	 * 查询投票选项的详情页面
	 */
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "queryVoteOptionDetail";
	}

}

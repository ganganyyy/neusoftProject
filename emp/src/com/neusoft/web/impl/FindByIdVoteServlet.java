package com.neusoft.web.impl;
/**
 * 查询某一个活动的所有投票选项的详情
 * @author 吴佳珊
 */
public class FindByIdVoteServlet extends VoteControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "queryVoteOptionDetail";
	}

}

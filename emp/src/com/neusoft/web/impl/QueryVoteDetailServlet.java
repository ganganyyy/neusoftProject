package com.neusoft.web.impl;
/**
 * 搜索投票选项详情
 * @author 吴佳珊
 */
public class QueryVoteDetailServlet extends VoteControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryVoteDetail";
	}

}

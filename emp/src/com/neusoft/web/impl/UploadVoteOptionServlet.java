package com.neusoft.web.impl;
/**
 * 用户上传活动的投票选项(参赛作品)
 * @author 吴佳珊
 */
public class UploadVoteOptionServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("uploadVoteOption", "用户上传活动详情");
		return "queryAllVote";
	}

}

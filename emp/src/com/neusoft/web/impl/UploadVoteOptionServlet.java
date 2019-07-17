package com.neusoft.web.impl;

public class UploadVoteOptionServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("uploadVoteOption", "用户上传活动详情");
		return "queryAllVote";
	}

}

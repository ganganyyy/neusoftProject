package com.neusoft.web.impl;

public class UploadVoteOptionServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("uploadVoteOption", "�û��ϴ������");
		return "queryAllVote";
	}

}

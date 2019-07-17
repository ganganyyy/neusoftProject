package com.neusoft.web.impl;

public class CheckByIdVoteServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		if(this.getInstance("checkByIdVote")==false)
		{
			System.out.println("这里哦是false");
			return "testUpload";
		}
		else
		{
			System.out.println("这里哦是true");
			this.saveAttribute("msg", "您已参加过活动");
			return "queryAllVote";
		}
	}

}

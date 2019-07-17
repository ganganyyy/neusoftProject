package com.neusoft.web.impl;

public class AddVoteServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		if(this.getInstance("findByIdForVoted")==false)
		{
		this.update("addVote", "投票");
		this.updateNoMsg("addVoteNum");
		}
		else
		{
			this.saveAttribute("msg", "今天已投过票");
		}
		return "queryAllVote";
	}

}

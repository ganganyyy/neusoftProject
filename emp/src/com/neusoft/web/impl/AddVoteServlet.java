package com.neusoft.web.impl;

public class AddVoteServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		if(this.getInstance("findByIdForVoted")==false)
		{
		this.update("addVote", "ͶƱ");
		this.updateNoMsg("addVoteNum");
		}
		else
		{
			this.saveAttribute("msg", "������Ͷ��Ʊ");
		}
		return "queryAllVote";
	}

}

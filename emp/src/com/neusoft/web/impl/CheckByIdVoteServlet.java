package com.neusoft.web.impl;

public class CheckByIdVoteServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		if(this.getInstance("checkByIdVote")==false)
		{
			System.out.println("����Ŷ��false");
			return "testUpload";
		}
		else
		{
			System.out.println("����Ŷ��true");
			this.saveAttribute("msg", "���Ѳμӹ��");
			return "queryAllVote";
		}
	}

}

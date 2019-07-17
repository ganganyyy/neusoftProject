package com.neusoft.web.impl;

public class QueryVoteDetailServlet extends VoteControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryVoteDetail";
	}

}

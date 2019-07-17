package com.neusoft.web.impl;

public class QueryAllVoteServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryAllVote";
	}

}

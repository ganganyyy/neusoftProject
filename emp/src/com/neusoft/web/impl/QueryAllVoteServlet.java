package com.neusoft.web.impl;
/**
 * �û��������л
 * @author ���ɺ
 */
public class QueryAllVoteServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryAllVote";
	}

}

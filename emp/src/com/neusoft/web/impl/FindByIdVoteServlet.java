package com.neusoft.web.impl;

public class FindByIdVoteServlet extends VoteControllerSupport 
{

	/**
	 * ��ѯͶƱѡ�������ҳ��
	 */
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "queryVoteOptionDetail";
	}

}

package com.neusoft.web.impl;
/**
 * ����ͶƱѡ������
 * @author ���ɺ
 */
public class QueryVoteDetailServlet extends VoteControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryVoteDetail";
	}

}

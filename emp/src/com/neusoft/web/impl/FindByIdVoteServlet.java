package com.neusoft.web.impl;
/**
 * ��ѯĳһ���������ͶƱѡ�������
 * @author ���ɺ
 */
public class FindByIdVoteServlet extends VoteControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "queryVoteOptionDetail";
	}

}

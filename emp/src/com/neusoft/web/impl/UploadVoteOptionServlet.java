package com.neusoft.web.impl;
/**
 * �û��ϴ����ͶƱѡ��(������Ʒ)
 * @author ���ɺ
 */
public class UploadVoteOptionServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("uploadVoteOption", "�û��ϴ������");
		return "queryAllVote";
	}

}

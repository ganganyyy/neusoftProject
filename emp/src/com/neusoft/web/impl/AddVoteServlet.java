package com.neusoft.web.impl;

import java.util.List;
import java.util.Map;

/**
 * ͶƱ����Ƿ�Ͷ��,����֮��ûͶ�������ͶƱ
 * @author ���ɺ
 */
public class AddVoteServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		if(this.getInstance("findByIdForVoted")==false)
		{
		this.update("addVote", "ͶƱ");
		this.saveAttribute("message", "ͶƱ�ɹ�");
		this.updateNoMsg("addVoteNum");
		}
		else
		{
			this.saveAttribute("message", "������Ͷ��Ʊ");
		}
		return "mainPage";
	}

}

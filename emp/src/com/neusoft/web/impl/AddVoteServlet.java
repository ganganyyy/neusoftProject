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
		this.updateNoMsg("addVoteNum");
		}
		else
		{
			this.saveAttribute("msg", "������Ͷ��Ʊ");
		}
		return "queryAllVote";
	}

}

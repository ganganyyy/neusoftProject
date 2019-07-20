package com.neusoft.web.impl;
/**
 * 投票检查是否投过,今日之内没投过则可以投票
 * @author 吴佳珊
 */
public class AddVoteServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		if(this.getInstance("findByIdForVoted")==false)
		{
		this.update("addVote", "投票");
		this.updateNoMsg("addVoteNum");
		}
		else
		{
			this.saveAttribute("msg", "今天已投过票");
		}
		return "queryAllVote";
	}

}

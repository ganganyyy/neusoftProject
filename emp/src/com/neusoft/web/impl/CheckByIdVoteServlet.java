package com.neusoft.web.impl;
/**
 * 用户参加活动,检查是否参加过,若没有则跳去上传作品页面
 * @author 吴佳珊
 */
public class CheckByIdVoteServlet extends VoteControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		if(this.getInstance("checkByIdVote")==false)
		{
			return "testUpload";
		}
		else
		{
			this.saveAttribute("msg", "您已参加过活动");
			return "queryAllVote";
		}
	}

}

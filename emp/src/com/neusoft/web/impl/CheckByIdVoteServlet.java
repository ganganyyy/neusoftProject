package com.neusoft.web.impl;
/**
 * �û��μӻ,����Ƿ�μӹ�,��û������ȥ�ϴ���Ʒҳ��
 * @author ���ɺ
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
			this.saveAttribute("msg", "���Ѳμӹ��");
			return "queryAllVote";
		}
	}

}

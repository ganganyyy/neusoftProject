package com.neusoft.web.impl;

/**
 * �ҵĵ���
 * @author ������
 */
public class MyLikesServlet extends LikeControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		
		this.getInstance("findByIdForPhoto","","ins");
		this.getInstanceList("myReciLikes", "", "reci");
		this.getInstanceList("myProLikes", "", "pro");
		this.getInstanceList("myCompLikes", "", "comp");
		return "queryHomeLike";
	}
}

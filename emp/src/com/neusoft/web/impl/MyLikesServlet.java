package com.neusoft.web.impl;

/**
 * �ҵĵ���
 * @author ������
 */
public class MyLikesServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.getInstanceList("myReciLikes", "", "reci");
		this.getInstanceList("myProLikes", "", "pro");
		this.getInstanceList("myCompLikes", "", "comp");
		return "queryHomeLike";
	}
}

package com.neusoft.web.impl;

/**
 * �������
 * @author ������
 */
public class CancleLikeServlet extends LikeControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("deleteLikes", "ȡ������");
		this.getInstanceList("myReciLikes", "", "reci");
		this.getInstanceList("myProLikes", "", "pro");
		this.getInstanceList("myCompLikes", "", "comp");
		return "queryHomeLike";
	}
}

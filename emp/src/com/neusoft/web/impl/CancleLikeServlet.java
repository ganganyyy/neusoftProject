package com.neusoft.web.impl;

public class CancleLikeServlet extends ProControllerSupport 
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

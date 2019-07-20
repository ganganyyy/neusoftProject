package com.neusoft.web.impl;

public class MyLikesServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.getInstanceList("findByIdForPhoto","","ins");
		this.getInstanceList("myReciLikes", "", "reci");
		this.getInstanceList("myProLikes", "", "pro");
		this.getInstanceList("myCompLikes", "", "comp");
		return "queryHomeLike";
	}
}

package com.neusoft.web.impl;

public class LikeProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("giveLike", "����");
		this.savePageInstance();
		return "product";
	}
}

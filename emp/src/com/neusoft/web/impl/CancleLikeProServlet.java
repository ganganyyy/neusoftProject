package com.neusoft.web.impl;

public class CancleLikeProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleLike", "ȡ������");
		this.savePageInstance();
		return "product";
	}
}

package com.neusoft.web.impl;

public class DelByIdSubServlet extends SubscribeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById","È¡Ïû¹Ø×¢");
		this.savePageDataForDelete();
		return "subscribeByMe";
	}

}

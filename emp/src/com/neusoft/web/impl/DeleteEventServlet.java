package com.neusoft.web.impl;

public class DeleteEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("deleteById", "ɾ��");
		return "eventManager";
	}

}

package com.neusoft.web.impl;

public class AddEventOptionServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("addEventOption", "��ӻѡ��");
		return "queryEvent";
	}

}

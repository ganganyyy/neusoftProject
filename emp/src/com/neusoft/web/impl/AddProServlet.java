package com.neusoft.web.impl;

public class AddProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addPro", "�ϴ�", "�ϴ��ɹ�", "");
		return "addPro";
	}
}

package com.neusoft.web.impl;

public class AddProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addPro", "上传", "上传成功", "");
		return "addPro";
	}
}

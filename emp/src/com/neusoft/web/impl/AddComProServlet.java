package com.neusoft.web.impl;

public class AddComProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComment", "上传", "上传成功", "");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		return "product";
	}
}

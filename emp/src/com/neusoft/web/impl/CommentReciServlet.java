package com.neusoft.web.impl;

public class CommentReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("comment", "��������");
		this.savePageInstance();
		this.saveSteps();
		return "details";
	}

}

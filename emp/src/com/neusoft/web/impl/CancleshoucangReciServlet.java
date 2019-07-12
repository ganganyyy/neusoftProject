package com.neusoft.web.impl;

public class CancleshoucangReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{		
		this.update("cancleShoucang", "»°œ˚ ’≤ÿ");
	    this.savePageInstance();
	    this.saveSteps();
	    return "details";
	}

}

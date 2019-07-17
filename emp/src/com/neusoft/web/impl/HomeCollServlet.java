package com.neusoft.web.impl;

public class HomeCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.getInstanceList("queryCollReci", "²ËÆ×", "reci");
		this.getInstanceList("queryCollPro", "×÷Æ·", "pro");
		this.getInstanceList("queryCollComp", "×¨À¸", "comp");
		return "queryHomeColl";
	}

}

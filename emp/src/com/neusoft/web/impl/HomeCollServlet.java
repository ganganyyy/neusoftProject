package com.neusoft.web.impl;

public class HomeCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.getInstanceList("queryCollReci", "����", "reci");
		this.getInstanceList("queryCollPro", "��Ʒ", "pro");
		this.getInstanceList("queryCollComp", "ר��", "comp");
		return "queryHomeColl";
	}

}

package com.neusoft.web.impl;

import com.neusoft.services.impl.HomeWorkServicesImpl;

public class QueryHomeWorkServlet extends HomeWorkControllerSupport 
{
	@Override
	public String execute()throws Exception
	{
		this.savePageInstance();
		this.savePageData();
		return "queryHomeWork";
		
	}
	

}

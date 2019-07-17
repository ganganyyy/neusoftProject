package com.neusoft.web.impl;

import java.util.List;
import java.util.Map;

public class UpgradeCountServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "upgrade";
	}

}

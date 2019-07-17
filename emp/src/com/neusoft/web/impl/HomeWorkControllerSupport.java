package com.neusoft.web.impl;

import com.neusoft.services.impl.HomeWorkServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class HomeWorkControllerSupport extends ControllerSupport 
{
	public HomeWorkControllerSupport()
	{
		this.setServices(new HomeWorkServicesImpl());
	}


}

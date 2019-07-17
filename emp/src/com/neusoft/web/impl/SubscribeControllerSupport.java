package com.neusoft.web.impl;

import com.neusoft.services.impl.SubOthersServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class SubscribeControllerSupport extends ControllerSupport 
{
	public SubscribeControllerSupport()
	{
		this.setServices(new SubOthersServicesImpl());
	}

}

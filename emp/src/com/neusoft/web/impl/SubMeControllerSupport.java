package com.neusoft.web.impl;

import com.neusoft.services.impl.SubMeServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class SubMeControllerSupport extends ControllerSupport 
{
	public SubMeControllerSupport()
	{
		this.setServices(new SubMeServicesImpl());
	}

}

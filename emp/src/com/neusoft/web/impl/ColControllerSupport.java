package com.neusoft.web.impl;

import com.neusoft.services.impl.ColServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ColControllerSupport extends ControllerSupport 
{
	public ColControllerSupport() 
	{
		this.setServices(new ColServicesImpl());
	}
}

package com.neusoft.web.impl;

import com.neusoft.services.impl.HomeEventServicesImpl;
import com.neusoft.web.support.ControllerSupport;
/**
 * 
 * @author Œ‚º—…∫
 */
public abstract class HomeEventControllerSupport extends ControllerSupport 
{

	public HomeEventControllerSupport()
	{
		this.setServices(new HomeEventServicesImpl());
	}

}

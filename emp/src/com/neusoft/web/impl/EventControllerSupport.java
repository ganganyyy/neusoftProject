package com.neusoft.web.impl;

import com.neusoft.services.impl.Ae01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;
/**
 * 
 * @author Œ‚º—…∫
 */
public abstract class EventControllerSupport extends ControllerSupport
{
	public EventControllerSupport()
	{
		this.setServices(new Ae01ServicesImpl());
	}
	

}

package com.neusoft.web.impl;

import com.neusoft.services.impl.VoteServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class VoteControllerSupport extends ControllerSupport 
{

	public VoteControllerSupport()
	{
		this.setServices(new VoteServicesImpl());
	}
	
	
	
	

}

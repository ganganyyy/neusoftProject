package com.neusoft.web.impl;

import java.lang.reflect.Method;

import com.neusoft.services.impl.HomepageServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class PersonalControllerSupport extends ControllerSupport 
{
	
	public PersonalControllerSupport() 
	{
		this.setServices(new HomepageServicesImpl());
	}
	
	
	
	



}

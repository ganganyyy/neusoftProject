package com.neusoft.web.impl;


import com.neusoft.services.impl.HomepageServicesImpl;
import com.neusoft.web.support.ControllerSupport;
/**
 * 
 * @author ���ɺ
 */
public abstract class PersonalControllerSupport extends ControllerSupport 
{
	public PersonalControllerSupport() 
	{
		this.setServices(new HomepageServicesImpl());
	}
}

package com.neusoft.web.impl;

import java.lang.reflect.Method;
import java.util.Map;

import com.neusoft.services.impl.Ae01ServicesImpl;
import com.neusoft.system.tools.Tools;
import com.neusoft.web.support.ControllerSupport;

public abstract class EventControllerSupport extends ControllerSupport
{
	public EventControllerSupport()
	{
		this.setServices(new Ae01ServicesImpl());
	}
	

}

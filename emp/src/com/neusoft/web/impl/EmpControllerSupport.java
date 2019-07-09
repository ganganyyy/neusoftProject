package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab01ServicesImpl1;
import com.neusoft.web.support.ControllerSupport;

public abstract class EmpControllerSupport extends ControllerSupport
{
	public EmpControllerSupport() 
	{
		this.setServices(new Ab01ServicesImpl1());
	}
}

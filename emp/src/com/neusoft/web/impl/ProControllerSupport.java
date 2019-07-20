package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac02ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * 关于作品
 * @author 韩金利
 */
public abstract class ProControllerSupport extends ControllerSupport 
{
	public ProControllerSupport() 
	{
		this.setServices(new Ac02ServicesImpl());
	}
}

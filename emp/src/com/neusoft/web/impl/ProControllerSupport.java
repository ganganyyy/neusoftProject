package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac02ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * ������Ʒ
 * @author ������
 */
public abstract class ProControllerSupport extends ControllerSupport 
{
	public ProControllerSupport() 
	{
		this.setServices(new Ac02ServicesImpl());
	}
}

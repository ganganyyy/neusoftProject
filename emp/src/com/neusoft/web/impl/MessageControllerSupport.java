package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab03ServicesImpl;
import com.neusoft.web.support.ControllerSupport;
/**
 * 
 * @author ���ɺ
 */
public abstract class MessageControllerSupport extends ControllerSupport 
{
	public MessageControllerSupport() 
	{
		this.setServices(new Ab03ServicesImpl());
	}

}

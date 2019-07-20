package com.neusoft.web.impl;

import com.neusoft.services.impl.MyLikeServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class LikeControllerSupport extends ControllerSupport 
{
	public LikeControllerSupport() 
	{
		this.setServices(new MyLikeServiceImpl());
	}
}

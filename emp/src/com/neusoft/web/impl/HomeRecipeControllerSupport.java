package com.neusoft.web.impl;

import com.neusoft.services.impl.HomeRecipeServicesImpl;
import com.neusoft.web.support.ControllerSupport;
/**
 * 
 * @author ���ɺ
 */
public abstract class HomeRecipeControllerSupport extends ControllerSupport 
{
	public HomeRecipeControllerSupport()
	{
		this.setServices(new HomeRecipeServicesImpl());
	}
}

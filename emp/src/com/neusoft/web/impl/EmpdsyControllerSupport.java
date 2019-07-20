//author:¶­ÊçæÂ
package com.neusoft.web.impl;

import com.neusoft.services.impl.Ac01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EmpdsyControllerSupport extends ControllerSupport 
{

	public EmpdsyControllerSupport() 
	{
		this.setServices(new Ac01ServicesImpl());
	}
}
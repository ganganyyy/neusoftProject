package com.neusoft.web.impl;

import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.neusoft.web.support.ControllerSupport;

public class LoginServlet extends Ab01ControllerSupport{
	
	@Override
	public String execute() throws Exception {
		this.getInstance("findById", "该用户不存在");
		if(this.checkIns())
		{
			//用户存在
			this.saveUserInfo();
			//TODO：跳到首页
			return "login";
		}
		else
		{
		return "login";
		}
	}

}

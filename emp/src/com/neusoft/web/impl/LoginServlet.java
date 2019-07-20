package com.neusoft.web.impl;

import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.neusoft.web.support.ControllerSupport;

public class LoginServlet extends Ab01ControllerSupport{
	
	@Override
	public String execute() throws Exception {
		System.out.println("enter loginServlet");
		this.getInstance("findById", "提示：用户名或密码错误！","ins");
		if(this.checkIns())
		{
			//用户存在
			this.saveUserInfo();
			//TODO：跳到首页
			return "mainPageAfterLogin";
		}
		else
		{
			System.out.println("return login2");
		return "login2";
		}
	}

	
}

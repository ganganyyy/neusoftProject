package com.neusoft.web.impl;

import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.neusoft.web.support.ControllerSupport;

public class LoginServlet extends Ab01ControllerSupport{
	
	@Override
	public String execute() throws Exception {
		this.getInstance("findById", "���û�������");
		if(this.checkIns())
		{
			//�û�����
			this.saveUserInfo();
			//TODO��������ҳ
			return "login";
		}
		else
		{
		return "login";
		}
	}

}

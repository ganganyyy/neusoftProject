package com.neusoft.web.impl;

import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.neusoft.web.support.ControllerSupport;

public class LoginServlet extends Ab01ControllerSupport{
	
	@Override
	public String execute() throws Exception {
		System.out.println("enter loginServlet");
		this.getInstance("findById", "��ʾ���û������������","ins");
		if(this.checkIns())
		{
			//�û�����
			this.saveUserInfo();
			//TODO��������ҳ
			return "mainPageAfterLogin";
		}
		else
		{
			System.out.println("return login2");
		return "login2";
		}
	}

	
}

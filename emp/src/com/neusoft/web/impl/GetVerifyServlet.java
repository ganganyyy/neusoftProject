package com.neusoft.web.impl;

import java.util.Random;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.neusoft.system.tools.SmsUtil;

public class GetVerifyServlet extends Ab01ControllerSupport {

	static String verifyCode=null;
	@Override
	public String execute() throws Exception {
		this.getInstance("getVerify", "获取短信验证码失败","ins");
		return "registe";
	}

	
}

package com.neusoft.web.impl;

import java.util.Random;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.neusoft.system.tools.SmsUtil;

public class GetVerifyServlet extends Ab01ControllerSupport {

	static String verifyCode=null;
	@Override
	public String execute() throws Exception {
		this.getInstance("getVerify", "短信验证码发送");
		return "registe";
	}

	
}

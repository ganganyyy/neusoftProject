package com.neusoft.web.impl;

import java.util.Random;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.neusoft.system.tools.SmsUtil;

/**
 * 请求短信验证码
 * @author 刘诗滢
 *
 */
public class GetVerifyServlet extends Ab01ControllerSupport {

	static String verifyCode=null;
	@Override
	public String execute() throws Exception {
		this.getInstance("getVerify", "获取短信验证码失败","ins");
		return "registe";
	}

	
}

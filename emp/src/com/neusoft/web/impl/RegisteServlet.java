package com.neusoft.web.impl;

public class RegisteServlet extends Ab01ControllerSupport {

	
	@Override
	public String execute() throws Exception {
		this.getInstance("findByTel", "该手机号还未注册");
		if(this.checkIns())
		{
			//手机号已被注册
			//覆盖msg，原因见this.getInstance代码
			this.saveAttribute("msg", "该手机已被注册");
			return "registe";
		}
		else
		{
			//未被注册，加入数据库
			this.update("addAb01", "注册");
			return "result";
		}
	}

}

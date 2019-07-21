package com.neusoft.web.impl;

import java.util.Map;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.neusoft.services.impl.Ab01ServicesImpl;

import com.neusoft.system.tools.SmsUtil;
import com.neusoft.web.support.ControllerSupport;

/**
 * 登录注册模块的support
 * @author 刘诗滢
 *
 */
public abstract class Ab01ControllerSupport extends ControllerSupport {

	public Ab01ControllerSupport() 
	{
		this.setServices(new Ab01ServicesImpl());
	}
	
	/**
	 * 检查返回的单一实例是否空
	 * 不为空:true
	 * @return
	 */
	protected boolean checkIns()
	{
		Object ins=this.getAttribute().get("ins");
		if(ins!=null)
		{
		
			return true;
		}
		else
		{
			return false;
		}
	}
	
	/**
	 * 首次登录时在session中存入用户流水号和用户类型
	 * aab101用户主键 ，
	 * aab105用户类型
	 */
	protected void saveUserInfo()
	{
		Map<String,String>ab01=(Map<String, String>) this.getAttribute().get("ins");
		if(ab01==null)
		{
			System.out.println("Ab01ControllerSupport:saveUserInfo出错");
			return;
		}
		System.out.println("saveUserInfo:"+ab01.get("aab101"));
		this.saveAttribute("aab101Self", ab01.get("aab101"));
		this.saveAttribute("aab105Self", ab01.get("aab105"));
	}

	
}

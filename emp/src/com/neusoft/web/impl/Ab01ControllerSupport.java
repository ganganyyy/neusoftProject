package com.neusoft.web.impl;

import java.util.Map;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.neusoft.services.impl.Ab01ServicesImpl;

import com.neusoft.system.tools.SmsUtil;
import com.neusoft.web.support.ControllerSupport;

/**
 * ��¼ע��ģ���support
 * @author ��ʫ��
 *
 */
public abstract class Ab01ControllerSupport extends ControllerSupport {

	public Ab01ControllerSupport() 
	{
		this.setServices(new Ab01ServicesImpl());
	}
	
	/**
	 * ��鷵�صĵ�һʵ���Ƿ��
	 * ��Ϊ��:true
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
	 * �״ε�¼ʱ��session�д����û���ˮ�ź��û�����
	 * aab101�û����� ��
	 * aab105�û�����
	 */
	protected void saveUserInfo()
	{
		Map<String,String>ab01=(Map<String, String>) this.getAttribute().get("ins");
		if(ab01==null)
		{
			System.out.println("Ab01ControllerSupport:saveUserInfo����");
			return;
		}
		System.out.println("saveUserInfo:"+ab01.get("aab101"));
		this.saveAttribute("aab101Self", ab01.get("aab101"));
		this.saveAttribute("aab105Self", ab01.get("aab105"));
	}

	
}

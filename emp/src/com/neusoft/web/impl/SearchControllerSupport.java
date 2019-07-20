package com.neusoft.web.impl;

import java.util.Map;

import com.neusoft.services.impl.Ac01PartServiceImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * ��ҳģ��
 * @author ��ʫ��
 *
 */
public abstract class SearchControllerSupport extends ControllerSupport {

	public SearchControllerSupport() {
	    this.setServices(new Ac01PartServiceImpl());
	}
	

	/**
	 * ����(�û�����ʳ��)
	 * @return
	 * @throws Exception
	 */
	protected String getIntanceListForOption()throws Exception
	{
		
		this.getInstanceList("queryForOption", "�������ݲ�����","rows");
		Map<String,String>extraInfo=this.getExtraInfo("getOption");
		String huntOption=extraInfo.get("huntOption");
		String backPage=null;
		if(huntOption.equals("ab01"))
		{
			backPage="userList";
		}
		else
		{
			backPage="menuList";
		}
	    return backPage;
		
	}
	

}

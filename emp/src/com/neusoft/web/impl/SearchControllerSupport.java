package com.neusoft.web.impl;

import java.util.Map;

import com.neusoft.services.impl.Ac01PartServiceImpl;
import com.neusoft.web.support.ControllerSupport;

/**
 * 主页模块
 * @author 刘诗滢
 *
 */
public abstract class SearchControllerSupport extends ControllerSupport {

	public SearchControllerSupport() {
	    this.setServices(new Ac01PartServiceImpl());
	}
	

	/**
	 * 搜索(用户或者食谱)
	 * @return
	 * @throws Exception
	 */
	protected String getIntanceListForOption()throws Exception
	{
		
		this.getInstanceList("queryForOption", "搜索内容不存在","rows");
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

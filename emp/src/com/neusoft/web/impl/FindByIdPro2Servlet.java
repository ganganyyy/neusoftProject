package com.neusoft.web.impl;

/**
 * �޸���Ʒǰ�Ĳ�ѯ
 * @author ������
 */
public class FindByIdPro2Servlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "modifyPro";
	}
}


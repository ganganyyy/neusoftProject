package com.neusoft.web.impl;
/**
 * ��������ϵͳ��Ϣ
 * @author ���ɺ
 */
public class QueryMessageServlet extends MessageControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.savePageData();
		return "message";
	}

}

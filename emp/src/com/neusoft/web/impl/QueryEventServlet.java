package com.neusoft.web.impl;
/**
 * ����Ա�������л
 * @author ���ɺ
 */
public class QueryEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryEvent";
	}

}

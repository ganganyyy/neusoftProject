package com.neusoft.web.impl;
/**
 * ����˭��ע��
 * @author ���ɺ
 */
public class QuerySubMeServlet extends SubMeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "whoSubMe";
	}

}

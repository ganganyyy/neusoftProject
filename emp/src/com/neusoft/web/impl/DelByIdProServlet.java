package com.neusoft.web.impl;

/**
 * ɾ����Ʒ
 * @author ������
 */
public class DelByIdProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.getInstanceList("myPro", "", "rows");
		this.getInstance("me", "", "ins");
		return "queryHomeWork";
	}
}

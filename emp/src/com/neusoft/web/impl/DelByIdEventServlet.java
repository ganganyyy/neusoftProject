package com.neusoft.web.impl;
/**
 * ����Աɾ���
 * @author ���ɺ
 */
public class DelByIdEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForDelete();
		return "queryEvent";
	}

}

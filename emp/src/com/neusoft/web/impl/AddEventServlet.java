package com.neusoft.web.impl;

/**
 * ����Ա��ӻ(����Ʒ�,����Ʒ�)
 * @author ���ɺ
 */
public class AddEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		boolean flag=this.updateForEvent("addEvent","��ӻ","aae107");
		if(flag)
		{
		 return "addEventOption";
		}
		else
		{
		return "queryEvent";
		}
	}

}

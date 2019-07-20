package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        Òµï¿½ï¿½ï¿½ß¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ü¹ï¿½×¢ï¿½ï¿½
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * ï¿½ï¿½ï¿½ï¿½Í¨ï¿½ï¿½ï¿½Ã·ï¿½ï¿½ï¿½,ÎªServicesï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ÃµÄ¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services=services;
	}
	
	protected BaseServices getServices()
	{
		return this.services;
	}
	
	/*****************************************
	 * 	        ï¿½ï¿½ï¿½ï¿½Òµï¿½ï¿½ï¿½ï¿½ï¿½Ì·ï¿½×°
	 *****************************************/
	/**
	 * ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ñ¯
	 * @throws Exception
	 */
	protected final void savePageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
			System.out.println("ÓÐÖ´ÐÐquery");
		}
		else
		{
			this.saveAttribute("msg", "Ã»ï¿½Ð·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½!");
		}	
	}
		
	/**
	 * @author:gangan
	 * ï¿½ï¿½ï¿½Ý·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È¡ï¿½ï¿½ï¿½ï¿½Êµï¿½ï¿½
	 * ï¿½ï¿½Ð´Ô­ï¿½ï¿½Ï£ï¿½ï¿½Í¨ï¿½ï¿½ï¿½ï¿½ï¿½ÝµÄ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void getInstanceList(String methodName,String msgText,String attributeName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.ï¿½ï¿½ï¿½Ã·ï¿½ï¿½ï¿½
		List<Map<String,String>> rows= (List<Map<String, String>>) method.invoke(services);
		if(rows.size()>0)
		{
			this.saveAttribute(attributeName,  rows);
		}
		else
		{
			this.saveAttribute("msg", msgText);
		}	
	}
	
	/**
	 * ï¿½ï¿½ï¿½Ý·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½È¡ï¿½ï¿½Ò»Êµï¿½ï¿½
	 * ï¿½ï¿½Ð´Ô­ï¿½ï¿½Ï£ï¿½ï¿½Í¨ï¿½ï¿½ï¿½ï¿½ï¿½ÝµÄ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	 * @author gangan
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void getInstance(String methodName,String msgText,String attributeName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.ï¿½ï¿½ï¿½Ã·ï¿½ï¿½ï¿½
		Object ins= method.invoke(services);
		if(ins!=null)
		{
			this.saveAttribute(attributeName,  ins);
		}
		else
		{
			this.saveAttribute("msg", msgText);
		}	
	}
	
	/**
	 * @author gangan
	 * ï¿½ï¿½È¡Ò»Ð©ï¿½ï¿½ï¿½ï¿½Òªï¿½ï¿½Ê¾ï¿½ï¿½Ò³ï¿½ï¿½ï¿½ï¿½ï¿½Ï¢ï¿½ï¿½
	 * ï¿½ï¿½ï¿½ï¿½ï¿½Ð¶ï¿½ï¿½ï¿½Ï¢ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ì¿ï¿½ï¿½ï¿½
	 * @param methodName
	 * @return
	 */
	protected final Map<String,String> getExtraInfo(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.ï¿½ï¿½ï¿½Ã·ï¿½ï¿½ï¿½
		Map<String,String>info=(Map<String, String>)method.invoke(services); 
		return info;
	}
	
	/**
	 * ï¿½ï¿½Ò»Êµï¿½ï¿½ ï¿½ï¿½Ñ¯
	 * @throws Exception
	 */
	protected final void savePageInstance()throws Exception
	{
		Map<String,String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
			System.out.println("ÓÐÖ´ÐÐfindById");
		}
		else
		{
			this.saveAttribute("msg", "ï¿½ï¿½Ê¾:ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½É¾ï¿½ï¿½ï¿½ï¿½ï¿½Ö¹ï¿½ï¿½ï¿½ï¿½!");
		}	
	}
	
	
	/**
	 * ¸ù¾Ý·½·¨Ãû»ñÈ¡µ¥Ò»ÊµÀý
	 * ±àÐ´Ô­Òò£ºÏ£ÍûÍ¨¹ý´«µÝµÄ·½·¨ÃûÀ´µ÷ÓÃ
	 * @author gangan
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void getInstance(String methodName,String msgText,String attributeName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.µ÷ÓÃ·½·¨
		Object ins= method.invoke(services);
		if(ins!=null)
		{
			this.saveAttribute(attributeName,  ins);
			System.out.println("getInstance:"+ins);
		}
		else
		{
			this.saveAttribute("msg", msgText);
		}	
	}
	
	/**
	 * Í¨ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö´ï¿½Ð¸ï¿½ï¿½Â·ï¿½ï¿½ï¿½
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.ï¿½ï¿½È¡ï¿½ï¿½Òªï¿½ï¿½ï¿½ÃµÄ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.ï¿½ï¿½ï¿½Ã·ï¿½ï¿½ï¿½
		return  (boolean)method.invoke(services);
	}
	

	
	/**
	 * »ñÈ¡µ¥Ò»ÊµÀý,ÊÇ·ñÓÐÖµÔÚÊý¾Ý¿â
	 * @author 33
	 * @param methodName
	 * @throws Exception
	 */
	protected final boolean getInstance(String methodName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.µ÷ÓÃ·½·¨
		Object ins= method.invoke(services);
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
	 * ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îªï¿½ï¿½ï¿½Ü¿ï¿½ï¿½ï¿½
	 * <
	 *   ï¿½ï¿½ï¿½ï¿½Ï¢ï¿½ï¿½Ê¾
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"ï¿½É¹ï¿½!":"Ê§ï¿½ï¿½!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	protected final boolean updateNoMsg(String methodName)throws Exception
	{
		return this.executeUpdateMethod(methodName);
	}
	
	protected final void updateForInfo(String methodName,String msgText,boolean flag)throws Exception
	{
		if(flag)
		{
		String msg=this.executeUpdateMethod(methodName)?"³É¹¦!":"Ê§°Ü!";
		this.saveAttribute("msg", msgText+msg);
		}
		else
		{
		String msg = "ÊäÈë´íÎóµÄ¾ÉÃÜÂë";
		this.saveAttribute("msg", msg);
		}
	}
	

	/**
	 * ´øÓÐ»î¶¯ÀàÐÍµÄ¸üÐÂÐÐÎª
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final boolean updateForEvent(String methodName,String typeText,String key)throws Exception
	{
		String msg=typeText+"Ê§°Ü!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=typeText+"³É¹¦!";
    	}
    	//ServletÏòÒ³ÃæÊä³öÊý¾Ý
    	this.saveAttribute("msg", msg);
    	Boolean flag;
    	if(this.dto.get(key).equals("1"))
    	{
    	    flag= true;
    	}
    	else
    	{
    		flag=false;
    	}
    	return flag;
	}
	

	
	/**
	 * ï¿½ï¿½ï¿½Ð±ï¿½Åµï¿½ï¿½ï¿½Ï¢ï¿½ï¿½Ê¾ï¿½Ä¸ï¿½ï¿½ï¿½ï¿½ï¿½Îª
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"Ê§ï¿½ï¿½!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servletï¿½ï¿½Ò³ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
    	this.saveAttribute("msg", msg);

	}
		
	
	
	/**
	 * É¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý¼ï¿½ï¿½ï¿½
	 * @throws Exception
	 */
	protected final void savePageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	
	
	/**
	 * @author:gangan
	 * ¸ù¾Ý·½·¨Ãû»ñÈ¡ÅúÁ¿ÊµÀý
	 * ±àÐ´Ô­Òò£ºÏ£ÍûÍ¨¹ý´«µÝµÄ·½·¨ÃûÀ´µ÷ÓÃ
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void getInstanceList(String methodName,String msgText,String attributeName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.µ÷ÓÃ·½·¨
		List<Map<String,String>> rows= (List<Map<String, String>>) method.invoke(services);
		if(rows.size()>0)
		{
			this.saveAttribute(attributeName,  rows);
			//System.out.println("getInstanceList£º"+rows);
		}
		else
		{
			this.saveAttribute("msg", msgText);
		}	
	}

	
	/**
	 * @author gangan
	 * »ñÈ¡Ò»Ð©²»ÐèÒªÏÔÊ¾ÔÚÒ³ÃæµÄÐÅÏ¢£º
	 * ÀýÈçÅÐ¶ÏÐÅÏ¢ÓÃÓÚÁ÷³Ì¿ØÖÆ
	 * @param methodName
	 * @return
	 */
	protected final Map<String,String> getExtraInfo(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.µ÷ÓÃ·½·¨
		Map<String,String>info=(Map<String, String>)method.invoke(services); 
		return info;
	}
	
	/*****************************************
	 * 	        ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //Í¬ï¿½ï¿½ÎªServicesï¿½ï¿½ï¿½ï¿½DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	//System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	 *****************************************/
    private Map<String,Object> attribute=new HashMap<>();
    protected final void  saveAttribute(String key,Object value)
    {
    	this.attribute.put(key, value);
    }
    
    @Override
    public final Map<String, Object> getAttribute() 
    {
    	return this.attribute;
    }
    
    
    
}

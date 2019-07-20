package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        业锟斤拷锟竭硷拷锟斤拷锟斤拷锟斤拷芄锟阶拷锟�
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * 锟斤拷锟斤拷通锟斤拷锟矫凤拷锟斤拷,为Services锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟矫的撅拷锟斤拷锟斤拷锟斤拷锟�
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
	 * 	        锟斤拷锟斤拷业锟斤拷锟斤拷锟教凤拷装
	 *****************************************/
	/**
	 * 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷询
	 * @throws Exception
	 */
	protected final void savePageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
			System.out.println("有执行query");
		}
		else
		{
			this.saveAttribute("msg", "没锟叫凤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷!");
		}	
	}
	
	/**
	 * 锟斤拷一实锟斤拷 锟斤拷询
	 * @throws Exception
	 */
	protected final void savePageInstance()throws Exception
	{
		Map<String,String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
			System.out.println("有执行findById");
		}
		else
		{
			this.saveAttribute("msg", "锟斤拷示:锟斤拷锟斤拷锟斤拷锟斤拷删锟斤拷锟斤拷锟街癸拷锟斤拷锟�!");
		}	
	}
	
	
	/**
	 * 根据方法名获取单一实例
	 * 编写原因：希望通过传递的方法名来调用
	 * @author gangan
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void getInstance(String methodName,String msgText,String attributeName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
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
	 * 通锟斤拷锟斤拷锟斤拷执锟叫革拷锟铰凤拷锟斤拷
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.锟斤拷取锟斤拷要锟斤拷锟矫的凤拷锟斤拷锟斤拷锟斤拷
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.锟斤拷锟矫凤拷锟斤拷
		return  (boolean)method.invoke(services);
	}
	

	
	/**
	 * 获取单一实例,是否有值在数据库
	 * @author 33
	 * @param methodName
	 * @throws Exception
	 */
	protected final boolean getInstance(String methodName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
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
	 * 锟斤拷锟斤拷锟斤拷为锟斤拷锟杰匡拷锟斤拷
	 * <
	 *   锟斤拷锟斤拷息锟斤拷示
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"锟缴癸拷!":"失锟斤拷!";
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
		String msg=this.executeUpdateMethod(methodName)?"成功!":"失败!";
		this.saveAttribute("msg", msgText+msg);
		}
		else
		{
		String msg = "输入错误的旧密码";
		this.saveAttribute("msg", msg);
		}
	}
	

	/**
	 * 带有活动类型的更新行为
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final boolean updateForEvent(String methodName,String typeText,String key)throws Exception
	{
		String msg=typeText+"失败!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=typeText+"成功!";
    	}
    	//Servlet向页面输出数据
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
	 * 锟斤拷锟叫憋拷诺锟斤拷锟较拷锟绞撅拷母锟斤拷锟斤拷锟轿�
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"失锟斤拷!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servlet锟斤拷页锟斤拷锟斤拷锟斤拷锟斤拷锟�
    	this.saveAttribute("msg", msg);

	}
		
	
	
	/**
	 * 删锟斤拷锟斤拷锟斤拷锟斤拷菁锟斤拷锟�
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
	 * 根据方法名获取批量实例
	 * 编写原因：希望通过传递的方法名来调用
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void getInstanceList(String methodName,String msgText,String attributeName)throws Exception
	{
		
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		List<Map<String,String>> rows= (List<Map<String, String>>) method.invoke(services);
		if(rows.size()>0)
		{
			this.saveAttribute(attributeName,  rows);
			//System.out.println("getInstanceList："+rows);
		}
		else
		{
			this.saveAttribute("msg", msgText);
		}	
	}

	
	/**
	 * @author gangan
	 * 获取一些不需要显示在页面的信息：
	 * 例如判断信息用于流程控制
	 * @param methodName
	 * @return
	 */
	protected final Map<String,String> getExtraInfo(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		Map<String,String>info=(Map<String, String>)method.invoke(services); 
		return info;
	}
	
	/*****************************************
	 * 	        锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //同锟斤拷为Services锟斤拷锟斤拷DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	//System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        锟斤拷锟斤拷锟斤拷锟斤拷锟�
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

package com.neusoft.web.support;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

/**
 * 将Servlet修改为向前台输入json数据
 * 并将登录后的用户流水号存入session
 * 退出后的用户流水号移出session
 * 将用户流水号放入dto中
 * @author 刘诗滢
 *
 */
@WebServlet("*.do")
public class BaseServletForJson extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String toPath=null;   //跳转的目标页面
         try
         {
        	/************************************************************
        	 *      解析访问路径,获取目标类的名称
        	 ************************************************************/
     		//拦截请求的访问路径
     		String  uri=request.getRequestURI();
     		System.out.println(request.getRequestURL());
     		//获取请求资源的主文件名
     		String baseName=uri.substring(uri.lastIndexOf("/")+1).replace(".do", "");
     		
     		//定义变量,描述所有业务控制器的基础包名称
     		String basePackageName="com.neusoft.web.impl.";
     		//获取控制器的前缀名
     		String controllerFirstName=baseName.substring(0,1).toUpperCase()+baseName.substring(1);
     		

     		/***********************************************************
     		 *                        实例化目标类---业务控制器
     		 ***********************************************************/
     		//实例化业务控制器
     		BaseController controller=(BaseController)Class.forName(basePackageName+controllerFirstName+"Servlet").newInstance();
     		
     		
     		/***********************************************************
     		 *                        向业务控制器,填充页面数据     i
     		 ***********************************************************/
     		//为业务控制器织入DTO切片
     		controller.setMapDto(this.createDto(request));
     		

     		/***********************************************************
     		 *                        调用业务控制器的流程控制方法
     		 ***********************************************************/
     		//调用流程控制方法
     		String returnValue=controller.execute();

     		/***********************************************************
     		 *                      处理控制器向页面输出的数据     o
     		 ***********************************************************/
     		//解析属性
     		Map<String,Object> rueqestAttribute=controller.getAttribute();
     		//织入属性处理切片
     		
     		//如果是登录且登录成功将用户流水号存入session
     		if(returnValue!=null&&returnValue.equals("mainPageAfterLogin"))
     		{
     			this.saveSesseion(request,rueqestAttribute);
     		}
     		//如果是退出登录将用户流水号移出session
     		if(returnValue!=null&&returnValue.equals("exit"))
     		{
     			this.removeSession(request.getSession());
     		}
     		this.writeToPage(response, rueqestAttribute);
         }	
         catch(Exception ex)
         {
        	 ex.printStackTrace();
        	 toPath="Error";
        	 
         }
		
	}
	
	/**
	 * 
	 * @author gangan
	 * 写入json数据到前台
	 * @param response
	 * @param rueqestAttribute
	 * @throws IOException
	 */
	private void writeToPage(HttpServletResponse response,Map<String,Object> rueqestAttribute) throws IOException
	{
		
		String jsonStr = JSON.toJSONString(rueqestAttribute);
		//解决json字符串中文乱码
		response.setContentType("text/html;charset=GBK");
	    PrintWriter out = response.getWriter();
	    out.print(jsonStr);
	    out.close();
		rueqestAttribute.clear();
	}
	
	/**
	 * 将用户流水号和用户类型保存在sesison中
	 * @param request
	 * @param rueqestAttribute
	 */
	private void saveSesseion(HttpServletRequest request,Map<String,Object>rueqestAttribute)
	{
		HttpSession session=request.getSession();
		session.setAttribute("aab101Self",rueqestAttribute.get("aab101Self"));
		session.setAttribute("aab105Self",rueqestAttribute.get("aab105Self"));
		System.out.println("session:"+session.getAttribute("aab101Self")+":"+session.getAttribute("aab105Self"));

	}
	
	/**
	 * 将用户流水号和用户类型移除session
	 * @param session
	 */
	private void removeSession(HttpSession session)
	{
		session.removeAttribute("aab101Self");
		session.removeAttribute("aab105Self");
	}
	
	/**
	 *  DTO切片
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//1.获取页面数据
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.导出所有键值对,形成键值对集合
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.定义数组,表示Enetry的value部分
		String value[]=null;
		
		//4.定义DTO容器
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.循环读取entrySet,获取每个键值对
		for(Entry<String,String[]> entry :entrySet)
		{
			//获取value部分的数组
			value=entry.getValue();
			//依据长度判断页面控件的类别
			if(value.length==1)  //非checkbox类控件
			{
		        //过滤掉页面未填充项目
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //checkbox类控件
			{
				dto.put(entry.getKey(), value);
			}	
		}
		
		this.addAab101(dto, request.getSession());
		
		System.out.println(dto);
		return dto;
	}

	/**
	 * 从Session中取出用户流水号和用户类型
	 * 放入dto中
	 * @param dto
	 * @param session
	 */
	private void addAab101(Map<String,Object>dto,HttpSession session)
	{
		dto.put("aab101Self", session.getAttribute("aab101Self"));
		dto.put("aab105Self", session.getAttribute("aab105Self"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}
	
}

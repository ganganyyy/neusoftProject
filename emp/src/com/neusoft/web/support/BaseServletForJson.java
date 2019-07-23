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
 * ��Servlet�޸�Ϊ��ǰ̨����json����
 * ������¼����û���ˮ�Ŵ���session
 * �˳�����û���ˮ���Ƴ�session
 * ���û���ˮ�ŷ���dto��
 * @author ��ʫ��
 *
 */
@WebServlet("*.do")
public class BaseServletForJson extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String toPath=null;   //��ת��Ŀ��ҳ��
         try
         {
        	/************************************************************
        	 *      ��������·��,��ȡĿ���������
        	 ************************************************************/
     		//��������ķ���·��
     		String  uri=request.getRequestURI();
     		System.out.println(request.getRequestURL());
     		//��ȡ������Դ�����ļ���
     		String baseName=uri.substring(uri.lastIndexOf("/")+1).replace(".do", "");
     		
     		//�������,��������ҵ��������Ļ���������
     		String basePackageName="com.neusoft.web.impl.";
     		//��ȡ��������ǰ׺��
     		String controllerFirstName=baseName.substring(0,1).toUpperCase()+baseName.substring(1);
     		

     		/***********************************************************
     		 *                        ʵ����Ŀ����---ҵ�������
     		 ***********************************************************/
     		//ʵ����ҵ�������
     		BaseController controller=(BaseController)Class.forName(basePackageName+controllerFirstName+"Servlet").newInstance();
     		
     		
     		/***********************************************************
     		 *                        ��ҵ�������,���ҳ������     i
     		 ***********************************************************/
     		//Ϊҵ�������֯��DTO��Ƭ
     		controller.setMapDto(this.createDto(request));
     		

     		/***********************************************************
     		 *                        ����ҵ������������̿��Ʒ���
     		 ***********************************************************/
     		//�������̿��Ʒ���
     		String returnValue=controller.execute();

     		/***********************************************************
     		 *                      �����������ҳ�����������     o
     		 ***********************************************************/
     		//��������
     		Map<String,Object> rueqestAttribute=controller.getAttribute();
     		//֯�����Դ�����Ƭ
     		
     		//����ǵ�¼�ҵ�¼�ɹ����û���ˮ�Ŵ���session
     		if(returnValue!=null&&returnValue.equals("mainPageAfterLogin"))
     		{
     			this.saveSesseion(request,rueqestAttribute);
     		}
     		//������˳���¼���û���ˮ���Ƴ�session
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
	 * д��json���ݵ�ǰ̨
	 * @param response
	 * @param rueqestAttribute
	 * @throws IOException
	 */
	private void writeToPage(HttpServletResponse response,Map<String,Object> rueqestAttribute) throws IOException
	{
		
		String jsonStr = JSON.toJSONString(rueqestAttribute);
		//���json�ַ�����������
		response.setContentType("text/html;charset=GBK");
	    PrintWriter out = response.getWriter();
	    out.print(jsonStr);
	    out.close();
		rueqestAttribute.clear();
	}
	
	/**
	 * ���û���ˮ�ź��û����ͱ�����sesison��
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
	 * ���û���ˮ�ź��û������Ƴ�session
	 * @param session
	 */
	private void removeSession(HttpSession session)
	{
		session.removeAttribute("aab101Self");
		session.removeAttribute("aab105Self");
	}
	
	/**
	 *  DTO��Ƭ
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//1.��ȡҳ������
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.�������м�ֵ��,�γɼ�ֵ�Լ���
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.��������,��ʾEnetry��value����
		String value[]=null;
		
		//4.����DTO����
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.ѭ����ȡentrySet,��ȡÿ����ֵ��
		for(Entry<String,String[]> entry :entrySet)
		{
			//��ȡvalue���ֵ�����
			value=entry.getValue();
			//���ݳ����ж�ҳ��ؼ������
			if(value.length==1)  //��checkbox��ؼ�
			{
		        //���˵�ҳ��δ�����Ŀ
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //checkbox��ؼ�
			{
				dto.put(entry.getKey(), value);
			}	
		}
		
		this.addAab101(dto, request.getSession());
		
		System.out.println(dto);
		return dto;
	}

	/**
	 * ��Session��ȡ���û���ˮ�ź��û�����
	 * ����dto��
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

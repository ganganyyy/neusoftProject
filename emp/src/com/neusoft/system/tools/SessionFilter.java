package com.neusoft.system.tools;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author ��ʫ��
 * ���ڽ��ֱ��ͨ��·�������Լ��ο�Ȩ�޵�¼
 * ���ڼ��session���û���ˮ�š��û�Ȩ��
 */

//@WebFilter("/*")
public class SessionFilter extends HttpServlet implements Filter {


	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		HttpSession session=request.getSession();

		
		String servletPath=request.getServletPath();
		System.out.println(servletPath);
		
		
		if(servletPath.equals("/mainPage.jsp")||servletPath.equals("/login.do")
				||servletPath.equals("/registe.do")||servletPath.equals("/registe.jsp")
				||servletPath.equals("/getVerify.do")||servletPath.equals("/result.jsp")
				||servletPath.equals("/login.jsp"))
		{
			//��ҳ����½��ע��ȫ������
			chain.doFilter(request, response);
			
			return;
		}
		
	    //ֱ�ӷ��ʳ�mainPage.jsp��ҳ�����Ƚ��е�¼
		if(session.getAttribute("aab101Self")==null)
		{
			System.out.println("���ȵ�¼����ת����¼ҳ��");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else
		{
			System.out.println("�û��Ѿ���¼���û�����Ϊ��"+session.getAttribute("aab105Self"));
			chain.doFilter(request, response);
		}

		//TODO:����aab105����Ȩ�޿��ƣ�չʾҳ��
	}

	
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


}

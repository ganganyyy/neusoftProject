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
 * @author 刘诗滢
 * 用于解决直接通过路径访问以及游客权限登录
 * 用于检查session中用户流水号、用户权限
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
			//首页、登陆、注册全部放行
			chain.doFilter(request, response);
			
			return;
		}
		
	    //直接访问除mainPage.jsp的页面需先进行登录
		if(session.getAttribute("aab101Self")==null)
		{
			System.out.println("请先登录，跳转到登录页面");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else
		{
			System.out.println("用户已经登录，用户类型为："+session.getAttribute("aab105Self"));
			chain.doFilter(request, response);
		}

		//TODO:根据aab105进行权限控制，展示页面
	}

	
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


}

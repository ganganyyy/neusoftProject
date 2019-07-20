package com.neusoft.services.impl;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.catalina.webresources.AbstractFileResourceSet;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.JdbcServicesSupport1;

public class addarticleservicesimpl extends JdbcServicesSupport1 
{
     
	public addarticleservicesimpl(Map<String, Object> dto) 
	{
		super(dto);
	}
	
	public Map<String, String>  rank()throws Exception
	{
		String sql =" select aab105 from ab01 where aab101=? ";
		Object args[]=
			{
				this.get("aab101Self")//用户流水号		
			};
		return  this.queryForMap(sql, args);
		
	}
	
	public boolean addarticle()throws Exception
	{
		//sql
		StringBuilder sql=new StringBuilder()
				              .append(" insert into ag01(aag102,aag103,aag104,aag105,")
				              .append("                  aag107,aag108,aag109)  ")
				              .append("  values(?,?,?,?,                 ")
				              .append("            ?,?,?)                 ")
				              ;
		 //参数
		Object args[]=
			{
					this.get("aab101Self"),//此处应动态获取，暂用固定值
					"01",//
					this.get("aag104"),
					this.get("aag105"),
		new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),
		             "03",//审核状态 默认值为03  待审核
		new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),			
			};
		
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	

}
 
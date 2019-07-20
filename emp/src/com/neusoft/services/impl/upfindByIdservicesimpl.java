package com.neusoft.services.impl;

import java.text.SimpleDateFormat;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class upfindByIdservicesimpl extends JdbcServicesSupport 
{

	public upfindByIdservicesimpl(Map<String, Object> dto)
	{
		super(dto);
		// TODO Auto-generated constructor stub
	}
     public boolean nopassmodify()throws Exception
     {
    	 StringBuilder sql= new StringBuilder()
	               .append("update ag01 a")
	               .append("  set   a.aag108=?  ")
	               .append(" where a.aag101=? ");
             Object args[]=
               {	
	   
		"01",		
		this.get("aag101")
               };
	return this.executeUpdate(sql.toString(), args)>0;
     }
	
	
	public boolean uppassmodify()throws Exception
	{
		StringBuilder sql= new StringBuilder()
	               .append("   update ag01 a   ")
	               .append("   set  a.aag108=? ,a.aag109=? ")
	               .append("   where a.aag101=? ")
                ;

            Object args[]=
           {			
		"02",		
		new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),	
		this.get("aag101")
		
		
   };
	return this.executeUpdate(sql.toString(), args)>0;      
	}
	
	
	public void usermodify()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				           .append(" update ab01  ")
				           .append(" set aab105=?  ")
				           .append("  where aab101=?");
		Object args[]=
			{
					"02",
					this.get("aag102")
			};
		this.executeUpdate(sql.toString(), args);
		
	}
	
	public void deleteById()throws Exception
	{
		String sql = "delete from ag01 where aag101=?";
		this.executeUpdate(sql, this.get("aag101"));
				
	}
	
}

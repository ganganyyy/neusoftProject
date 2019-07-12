package com.neusoft.services.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.DBUtils;
import com.neusoft.system.tools.Tools;

public class Ac01ServicesImpl extends JdbcServicesSupport 
{
	public boolean addInsg(Map<String,Object> dto,int i)throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac06(aac101,aac602,aac603)")
    			.append("          values(?,?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			dto.get("aac101"),
    			dto.get(i+"aac602"),
    			dto.get(i+"aac603")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	public boolean addStep(Map<String,Object> dto,int i)throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac04(aac101,aac402,aac403,aac404)")
    			.append("          values(?,?,?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			dto.get("aac101"),
    			dto.get(i+"aac402"),
    			dto.get("aac403"),
    			dto.get(i+"aac404")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
    public boolean addReci(Map<String,Object> dto)throws Exception
    {
    	
        //aac106 当前用户流水号
    	String aac106="1";
        dto.put("aac106", aac106);
        
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac01(aac102,aac103,aac104,aac105,aac106,")
    			.append("                 aac107,aac108,aac109,aac110)")
    			.append("          values(?,NOW(),null,?,?,")
    			.append("                 ?,?,'0','0')")
    			;
    	//2.编写参数数组
    	Object args[]={
    			dto.get("aac102"),
    			dto.get("aac105"),
    			dto.get("aac106"),
    			dto.get("aac107"),
    			dto.get("aac108")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
    public boolean deleteById()throws Exception
    {
    	String sql="delete from ac01 where aac101=?";
    	return this.executeUpdate(sql, "2")>0;
    }
	
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac102,date_format(a.aac103,'%Y-%m-%d' ) aac103,a.aac104,a.aac105,a.aac106,")
    			.append("       a.aac107,a.aac108")
    			.append("  from ac01 a")
    			.append(" where a.aac101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), "19");
    }
    
	  public List<Map<String,String>> querySteps()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac402,a.aac403,a.aac404")
	    			.append("  from ac04 a")
	    			.append(" where a.aac101=? order by a.aac404 asc")
	    			;
	    	return this.queryForList(sql.toString(), "19");
	  }
	  
	  public List<Map<String,String>> query()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac602,a.aac603")
	    			.append("  from ac06 a")
	    			.append(" where a.aac101=?")
	    			;
	    	return this.queryForList(sql.toString(), "19");
	  }
    
}

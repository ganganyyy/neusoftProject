package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ac01ServicesImpl extends JdbcServicesSupport 
{
    public boolean addReci(Map<String,Object> dto,String aac108)throws Exception
    {
//    	//获取当前员工编号
//      String aac106=Tools.getEmpNumber();
    	String aac106="1";
//    	//向DTO添加员工编号
        dto.put("aac106", aac106);
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac01(aac102,aac103,aac104,aac105,aac106,")
    			.append("                 aac107,aac108,aac109,aac110)")
    			.append("          values(?,NOW(),NOW(),?,?,")
    			.append("                 ?,?,'0','0')")
    			;
    	//2.编写参数数组
    	Object args[]={
    			dto.get("aac102"),
    			dto.get("aac105"),
    			aac106,
    			dto.get("aac107"),
    			aac108
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
    	return this.queryForMap(sql.toString(), "1");
    }
    
	  public List<Map<String,String>> querySteps()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac402,a.aac403,a.aac404")
	    			.append("  from ac04 a")
	    			.append(" where a.aac101=? order by a.aac404 asc")
	    			;
	    	return this.queryForList(sql.toString(), "1");
	  }
	  
	  public List<Map<String,String>> query()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac602,a.aac603")
	    			.append("  from ac06 a")
	    			.append(" where a.aac101=?")
	    			;
	    	return this.queryForList(sql.toString(), "1");
	  }
    
}

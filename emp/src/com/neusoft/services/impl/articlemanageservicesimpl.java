package com.neusoft.services.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.lang.String;
import javax.swing.ListModel;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.jasper.tagplugins.jstl.core.Param;
import org.apache.naming.java.javaURLContextFactory;

import com.mysql.jdbc.ResultSetMetaData;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.JdbcServicesSupport1;
import com.neusoft.system.db.DBUtils;


public class articlemanageservicesimpl extends JdbcServicesSupport1
{
	
	public articlemanageservicesimpl(Map<String, Object> dto) 
	{
		super(dto);
	}
	
	public boolean deleteById()throws Exception
	{
		String sql ="delete  from ag01 where aag101=?";
		return this.executeUpdate(sql, this.get("aag101"))>0;
	}
	
	
	
	
	
	public boolean modifyarticle()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				               .append("update ag01 a")
				               .append("  set a.aag104=?,a.aag105=? ")
				               .append(" where a.aag101=? ");
		Object args[]=
			{
					
					this.get("aag104"),
					this.get("aag105"),
					this.get("aag101")
			};
				return this.executeUpdate(sql.toString(), args)>0;               
	}
	
	
	public boolean batchDelete()throws Exception
	{
		String sql="delete from ag01 where  aag101=?";
		
		String idlist[]=this.getIdList("idlist");
		
		return this.batchUpdate(sql, idlist);
	}
	
	public Map<String, String> findById()throws Exception
	{
		
		StringBuilder sql= new StringBuilder()
				             .append(" select a.aag104 , a.aag105 ")
				             .append("   from ag01 a")
				              .append("   where a.aag101=?");
		return this.queryForMap(sql.toString(), this.get("aag101"));
	}
	
	
	//查询
  public List<Map<String, String>> query() throws Exception
  {
	
		  Object aag104=this.get("qaag104");//标题  模糊查询
		  Object aag108=this.get("qaag108");//申请状态
		  Object baag107=this.get("baag107");//申请时间b
		  Object eaag107=this.get("eaag107");//申请时间e
		  
		  
		StringBuilder sql=new StringBuilder()
				.append("   select x.aag101,x.aag104,x.aag105,a.fvalue staag108, ")
				.append("	 x.aag106,x.aag107,x.aag109   ")
				.append("	 from ag01 x  , syscode  a  ")
				.append(" where aag103=01 and aag101=? and x.aag108=a.fcode and a.fname='aag108' ");
		List<Object> paramlist=new ArrayList<>();
		this.get("aab101Self");//此处应动态获取流水号  暂用固定值
		
		if(this.isNotNull(aag104))
		{
			sql.append("  and x.aag104  like?");
			paramlist.add("%"+aag104+"%");
		}
		if(this.isNotNull(aag108))
		{
			sql.append("  and x.aag108 =?");
			paramlist.add(aag108);
		}
		if(this.isNotNull(baag107))
		{
			sql.append("  and x.aag107 >=?");
			paramlist.add(baag107);
		}
		if(this.isNotNull(eaag107))
		{
			sql.append("  and x.aag107 <=?");
			paramlist.add(eaag107);
		}
		
		sql.append(" order by x.aag107");
		System.out.println(sql.toString());
		System.out.println(paramlist);
		
		return this.queryForList(sql.toString(), paramlist.toArray());
	  
  
    }

}

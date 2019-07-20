package com.neusoft.services.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.DBUtils;

public class lookarticleservicesimpl extends JdbcServicesSupport 
{

	public lookarticleservicesimpl(Map<String, Object> dto)
	{
		super(dto);
		
	}
	
	public void deleteById(boolean msg)throws Exception
	{
		String sql ="delete  from ag01 where aag101=?";
		if(msg)
		{
		 this.executeUpdate(sql, this.get("aag101"));
		}
	}
	
	
	
	public List<Map<String, String>> query() throws Exception
	  {
		
		  PreparedStatement pstm=null;
		  ResultSet rs=null;
		  try
		  {
			  Object aag104=this.get("qaag104");//标题  模糊查询
			  Object aag108=this.get("qaag108");//申请状态
			  Object baag107=this.get("baag107");//申请时间b
			  Object eaag107=this.get("eaag107");//申请时间e
			  
			  
			StringBuilder sql=new StringBuilder()
					.append("   select x.aag101,b.fvalue staag102,x.aag104,x.aag105,a.fvalue staag108, ")
					.append(" 	     x.aag106,x.aag107,x.aag109   ")
				    .append(" 		 from ag01 x  , syscode  a , syscode b   ")
					.append("  where aag103=01  and (aag108=01 or aag108=03)  and a.fname='aag108' and x.aag108=a.fcode   ")
					.append("              and   b.fname='aab102'  and x.aag102=b.fcode   ");
			List<Object> paramlist=new ArrayList<>();
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
				paramlist.add("baag107");
			}
			if(this.isNotNull(eaag107))
			{
				sql.append("  and x.aag107 <=?");
				paramlist.add("eaag107");
			}
			
			sql.append(" order by x.aag107");
			
			
			pstm=DBUtils.prepareStatement(sql.toString());
			
			int index=1;
			for(Object param:paramlist)
			{
				pstm.setObject(index++, param);
			}
			
			rs=pstm.executeQuery();
			java.sql.ResultSetMetaData rsmd= rs.getMetaData();
			int count=rsmd.getColumnCount();
			int initsize=((int)(count/0.75)+1);
			List<Map<String, String>> rows=new ArrayList<>();
			Map<String, String> ins=null;
			while(rs.next())
			{
				ins=new HashMap<>(initsize);
				for(int i=1;i<=count;i++)
				{
					ins.put(rsmd.getColumnLabel(i).toLowerCase(),rs.getString(i));
				}
				rows.add(ins);
			}
			return rows;
		  } 
		 finally
		 {
			DBUtils.close(rs);
			DBUtils.close(pstm);
		}
	  }
	
	
	
	
	
	public boolean passmodifyarticle()throws Exception
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
	
         public void addarticle(boolean msg)throws Exception
         {
        	 StringBuilder sql=new StringBuilder()
        			 .append(" insert into ac03(aac302,aac303,aac304,aac305,aac306,aac307,aac308,aac309) ")
                     .append("      values(?,?,?,?,?,?,?,?)     ");
        	 
        	 Object args[]=
        		 {
        			 this.get("aag104"),	
 					this.get("aag105"),
 					this.get("aag107"),
 					new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),	
 					this.get("aag102"),
 					this.get("aag106")	, 
 					0,//点赞数默认为0
 					0//收藏数默认为0
        		 };
        	 if(msg)
        	 {
                   this.executeUpdate(sql.toString(), args);
        	 }
         }
	
	
	public boolean nopassmodifyarticle()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				               .append("update ag01 a")
				               .append("  set   a.aag108=? ,a.aag109=? ")
				               .append(" where a.aag101=? ");
		Object args[]=
			{	
				   
					"01",	
					new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),	
					this.get("aag101")
			};
				return this.executeUpdate(sql.toString(), args)>0;               
	}
	
	
	

}

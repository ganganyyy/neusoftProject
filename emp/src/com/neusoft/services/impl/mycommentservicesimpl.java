package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class mycommentservicesimpl extends JdbcServicesSupport {

	public mycommentservicesimpl(Map<String, Object> dto) {
		super(dto);
		// TODO Auto-generated constructor stub
	}
	
	public boolean deleteById()throws Exception
	{
		String sql ="delete  from ad04 where aad401=?";
		return this.executeUpdate(sql, this.get("aad401"))>0;
	}
	
	
	
	public boolean batchDelete()throws Exception
	{
		String sql="delete from ad04 where  aad401=?";
		
		String idlist[]=this.getIdList("idlist");
		
		return this.batchUpdate(sql, idlist);
	}

	
	public List<Map<String, String>> query() throws Exception
	  {
		      Object aad404=this.get("qaad404");//评论内容
			  Object aad402=this.get("qaad402");//评论类型
			 
			 
			  
			StringBuilder sql=new StringBuilder()
					.append(" select x.aad401,a.fvalue staad402,x.aad403,x.aad404 ")
					.append("  from ad04  x ,syscode a  ")
					.append("  where x.aad405=?  and a.fname='aad402' and a.fcode=x.aad402 ");
			List<Object> paramlist=new ArrayList<>();
			paramlist.add(4);//此处应动态获取流水号  暂用固定值
			
			if(this.isNotNull(aad404))
			{
				sql.append("  and x.aad404  like?");
				paramlist.add("%"+aad404+"%");
			}
			if(this.isNotNull(aad402))
			{
				sql.append("  and x.aad402 =?");
				paramlist.add(aad402);
			}
						
			sql.append(" order by x.aad404");
			System.out.println(sql.toString());
			System.out.println(paramlist);
			
			return this.queryForList(sql.toString(), paramlist.toArray());
		  
	  
	    }


}

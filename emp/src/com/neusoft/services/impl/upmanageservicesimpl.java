package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class upmanageservicesimpl extends JdbcServicesSupport 
{

	public upmanageservicesimpl(Map<String, Object> dto) {
		super(dto);
	}
	
	public Map<String, String> findById()throws Exception
	{
		
		StringBuilder sql= new StringBuilder()
				             .append(" select a.aag102,a.aag104 , a.aag105,a.aag106 ,a.aag107 ")
				             .append("    from ag01 a ")
				              .append("   where a.aag101=?");
		return this.queryForMap(sql.toString(), this.get("aag101"));
		
	}
	
	

	
	public List<Map<String, String>> query() throws Exception
	  {
		
			  Object aag104=this.get("qaag104");//标题  模糊查询
			  Object aag108=this.get("qaag108");//申请状态
			  Object baag107=this.get("baag107");//申请时间b
			  Object eaag107=this.get("eaag107");//申请时间e
			  
			  
			StringBuilder sql=new StringBuilder()
					.append(" select x.aag101,b.aab102 staag102,x.aag104,x.aag105,a.fvalue staag108,  ")
					.append("	  x.aag106,x.aag107,x.aag109      ")
					.append("	  from ag01 x  , syscode  a  ,ab01 b ")
					.append(" where aag103=02 and x.aag108=a.fcode and a.fname='aag108'   and x.aag102=b.aab101 ");
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

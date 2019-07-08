package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ac02ServicesImpl extends JdbcServicesSupport 
{	
	//��ѯ������Ʒ
    public List<Map<String,String>> query()throws Exception
    {
    	//1.��дSQL���
    	String sql="select aac201,aab101,aac202,aac203,aac204,aac207 from ac02";
    	//ִ�в�ѯ
    	return this.queryForList(sql);
    }
    
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac201,a.aab101,a.aac202,a.aac203,a.aac204,")
    			.append("       a.aac207,c.aac102,b.aab102,b.aab106")
    			.append("  from ac02 a, ab01 b, ac01 c")
    			.append(" where a.aac201=? and a.aab101=b.aab101 and a.aac207=c.aac101 ")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aac201"));
    }
}

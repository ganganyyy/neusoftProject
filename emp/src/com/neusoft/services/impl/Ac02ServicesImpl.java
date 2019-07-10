package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ac02ServicesImpl extends JdbcServicesSupport 
{	
	//查询所有作品
    public List<Map<String,String>> query()throws Exception
    {
    	//1.编写SQL语句
    	String sql="select aac201,aab101,aac202,aac203,aac204,aac207 from ac02";
    	//执行查询
    	return this.queryForList(sql);
    }
    
    //查询某一作品详情
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac201,a.aab101,a.aac202,a.aac203,a.aac204,")
    			.append("       a.aac207,c.aac102,b.aab102,b.aab106")
    			.append("  from ac02 a, ab01 b, ac01 c")
    			.append(" where a.aab101=b.aab101")
    			.append("   and a.aac207=c.aac101")
    			.append("   and a.aac201=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aac201"));
    }
    
    /*
     * 上传作品insert into ac02(aab101,aac202,aac203,aac204,aac207,aac205,aac206)
     * values('1',NOW(),'啊啊啊啊啊啊啊啊啊','img/san.jpg','1', '0','0')
     */
    private boolean addPro()throws Exception
    {
    	//获取当前员工编号
    	String aab101="1";
    	//向DTO添加员工编号
    	this.put("aab101", aab101);
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aab101,aac202,aac203,aac204,aac207,")
    			.append("                 aac205,aac206)")
    			.append("          values(?,NOW(),?,?,?,")
    			.append("                 '0','0')")
    			;
    	//2.编写参数数组
    	Object args[]={
    			aab101,
    			this.get("aac203"),
    			this.get("aac204"),
    			this.get("aac207")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    /*
     * 点赞作品
     * 1、向点赞表里增加点赞数据
     * insert into ad01(aab101,aad102,aad103,aad104)
       values('1',NOW(),'02','1')
     * 2、更新作品表里的点赞数
     * UPDATE ac02 a
       set a.aac205=a.aac205+1
       WHERE a.aac201=1
     */
    private boolean giveLike()throws Exception
    {
    	//获取当前员工编号
    	String aab101="1";
    	//向DTO添加员工编号
    	this.put("aab101", aab101);
    	
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad01(aab101,aad102,aad103,aad104)")
    			.append("          values(?,NOW(),'02',?)")
    			;
    	Object args1[]={
    			aab101,
    			this.get("aac201"),
    	};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac205=a.aac205+1")
    			.append(" where a.aac201=?")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    
    //取消点赞
    private boolean cancleLike()throws Exception
    {
    	//获取点赞流水号
    	String aad101="1";
    	//向DTO添加点赞流水号
    	this.put("aad101", aad101);
    	
    	String sql1="delete from ad01 where aad101=?";
    	
    	Object args1[]={aad101};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac205=a.aac205-1")
    			.append(" where a.aac201=?")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    
}

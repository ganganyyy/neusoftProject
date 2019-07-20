package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

/**
 * 管理点赞
 * @author 韩金利
 */
public class MyLikeServiceImpl extends JdbcServicesSupport 
{
	
	public Map<String,String> findByIdForPhoto()throws Exception
	{
		String sql = "select aab102,aab106,aab107,aab108 from ab01 where aab101=?";
		return this.queryForMap(sql,this.get("aab101Self"));
	}
	
    //查询我点赞的菜谱
    private List<Map<String,String>> myReciLikes()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad101,b.aac102,b.aac108,b.aac101")    			
    			.append("  from ad01 a, ac01 b ")
    			.append(" where a.aad104=b.aac101 ")
    			.append("   and a.aad103='01' ")
    			.append("   and a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab101Self")   			
    	};
    	return this.queryForList(sql.toString(),args);
    }
    //查询我点赞的作品
    private List<Map<String,String>> myProLikes()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad101,b.aac204,b.aac203,b.aac201")    			
    			.append("  from ad01 a, ac02 b ")
    			.append(" where a.aad104=b.aac201 ")
    			.append("   and a.aad103='02' ")
    			.append("   and a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab101Self")   			
    	};
    	return this.queryForList(sql.toString(),args);
    }
    //查询我点赞的专栏
    private List<Map<String,String>> myCompLikes()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad101,b.aac302,b.aac301")    			
    			.append("  from ad01 a, ac03 b ")
    			.append(" where a.aad104=b.aac301 ")
    			.append("   and a.aad103='03' ")
    			.append("   and a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab101Self")  			
    	};
    	return this.queryForList(sql.toString(),args);
    }
    
    //取消作品点赞
    private boolean cancleProLike()throws Exception
    {
    	String sql1="delete from ad01 where aad103='02' and aab101=? and aad104=? ";
    	
    	Object args1[]={this.get("aab101Self"),this.get("aac201")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac206=a.aac206-1")
    			.append(" where a.aac201=?")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);
    	    	
    	return this.executeTransaction();
    }
    //取消菜谱点赞
    private boolean cancleReciLike()throws Exception
    {
    	String sql1="delete from ad01 where aad103='01' and aab101=? and aad104=? ";
    	Object args1[]={this.get("aab101Self"),this.get("aac101")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac109=a.aac109-1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={this.get("aac101")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    //取消专栏点赞
    private boolean cancleCompLike()throws Exception
    {
    	String sql1="delete from ad01 where aad103='03' and aab101=? and aad104=? ";
    	Object args1[]={this.get("aab101Self"),this.get("aac101")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac03 a")
    			.append("   set a.aac308=a.aac308-1")
    			.append(" where a.aac301=?")
    			;
    	Object args2[]={this.get("aac301")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    //删除点赞
    private boolean deleteLikes()throws Exception
    {
    	String tag=(String)this.get("aad103");
    	if(tag.equals("01"))
    	{
    		return cancleReciLike();
    	}
    	if(tag.equals("02"))
    	{
    		return cancleProLike();
    	}
    	else
    	{
    		return cancleCompLike();
    	}
    }

}

//author:董淑媛
package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.neusoft.services.JdbcServicesSupport;

public class ColServicesImpl extends JdbcServicesSupport 
{
	   //获取收藏夹图片
	   public String getImg()
	   {
		   Random ran = new Random();
		   int i = ran.nextInt(5);
		      switch(i)
		      {
		         case 1:
		            return "img/collection/01.jpeg";
		         case 2:
		        	return "img/collection/02.jpg";
		         case 3:
		        	return "img/collection/03.jpg";
		         case 4:
			        return "img/collection/04.jpg";
		         case 5:
			        return "img/collection/05.jpeg";
		         default:
		        	return "img/collection/06.jpg";
		      }
		   }
	
	//查询用户
	public Map<String,String> findById()throws Exception
	{
	String sql = "select aab102,aab106,aab107,aab108 from ab01 where aab101=?";

	return this.queryForMap(sql,this.get("aab101Self"));
	}
    //取消收藏
    private boolean deleteColle()throws Exception
    {
    	String tag=(String)this.get("aad203");
    	
    	if(tag=="01")
    	{
    		return canclePro();
    	}
    	if(tag=="02")
    	{
    		return cancleReci();
    	}
    	else
    	{
    		return cancleComp();
    	}
    }
	//取消专栏收藏
    private boolean cancleComp()throws Exception
    {   	
    	String sql1="delete from ad02 where aad201=? ";
    	Object args1[]={this.get("aad201")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac03 a")
    			.append("   set a.aac309=a.aac309-1")
    			.append(" where a.aac301=? ")
    			;
    	Object args2[]={this.get("aac01")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
	//取消作品收藏
    private boolean canclePro()throws Exception
    {   	
    	String sql1="delete from ad02 where aad201=? ";
    	Object args1[]={this.get("aad201")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac205=a.aac205-1")
    			.append(" where a.aac201=? ")
    			;
    	Object args2[]={this.get("aac01")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }

	//取消菜谱收藏
    private boolean cancleReci()throws Exception
    {
    	String sql1="delete from ad02 where aad201=? ";
    	Object args1[]={this.get("aad201")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac110=a.aac110-1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={this.get("aac01")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    
	  //查询菜谱
	  public List<Map<String,String>> queryCollReci()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad201,a.aad203,b.aac101,b.aac102,b.aac108")
	    			.append("  from ad02 a,ac01 b")
	    			.append(" where a.aad301=? and a.aad203='01' and a.aad204=b.aac101")
	    			;
	      return this.queryForList(sql.toString(),this.get("aad301"));
	  }
	  
	  //查询作品
	  public List<Map<String,String>> queryCollPro()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad201,a.aad203,b.aac201,b.aac203,b.aac204")
	    			.append("  from ad02 a,ac02 b")
	    			.append(" where a.aad301=? and a.aad203='02' and a.aad204=b.aac201")
	    			;
	      return this.queryForList(sql.toString(),this.get("aad301"));
	  }
	  
	  //查询专栏
	  public List<Map<String,String>> queryCollComp()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad201,a.aad203,b.aac301,b.aac302")
	    			.append("  from ad02 a,ac03 b")
	    			.append(" where a.aad301=? and a.aad203='03' and a.aad204=b.aac301")
	    			;
	      return this.queryForList(sql.toString(),this.get("aad301"));
	  }
	
      //查询收藏夹
	  public List<Map<String,String>> queryCollections()throws Exception
	  {
		  //当前用户流水号
		  String aab101="1";
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad301,a.aad302,a.aad303")
	    			.append("  from ad03 a")
	    			.append(" where a.aab101=?")
	    			;
	      return this.queryForList(sql.toString(), aab101);
	  }
	  
      //收藏夹重命名
	  public boolean rename()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("update ad03")
	    			.append("   set aad302=?")
	    			.append(" where aad301=?")
	    			;
		  Object args[]={this.get("raad302"),this.get("raad301")};
	      return this.executeUpdate(sql.toString(), args)>0;
	  }
	  
      //删除收藏夹
	  public boolean deleteColl()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("delete from ad03")
	    			.append(" where aad301=?")
	    			;
		  Object args[]={this.get("daad301")};
	      return this.executeUpdate(sql.toString(), args)>0;
	  }

      //创建收藏夹
	  public boolean createColl()throws Exception
	  {
		  //当前用户流水号
		  String aab101="1";
		  StringBuilder sql=new StringBuilder()
	    			.append("insert into ad03(aab101,aad302,aad303)")
	    			.append("       values(?,?,?) ")
	    			;
		  Object args[]={aab101,this.get("caad302"),getImg()};
	      return this.executeUpdate(sql.toString(), args)>0;
	  }
}

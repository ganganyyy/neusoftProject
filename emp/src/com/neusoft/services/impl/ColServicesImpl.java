//author:¶­ÊçæÂ
package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.neusoft.services.JdbcServicesSupport;

public class ColServicesImpl extends JdbcServicesSupport
{
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

	public Map<String,String> findById()throws Exception
	{
	String sql = "select aab102,aab106,aab107,aab108 from ab01 where aab101=?";

	return this.queryForMap(sql,this.get("aab101Self"));
	}
	
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


	  public List<Map<String,String>> queryCollReci()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad201,a.aad203,b.aac101,b.aac102,b.aac108")
	    			.append("  from ad02 a,ac01 b")
	    			.append(" where a.aad301=? and a.aad203='01' and a.aad204=b.aac101")
	    			;
	      return this.queryForList(sql.toString(),this.get("aad301"));
	  }

	  
	  public List<Map<String,String>> queryCollPro()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad201,a.aad203,b.aac201,b.aac203,b.aac204")
	    			.append("  from ad02 a,ac02 b")
	    			.append(" where a.aad301=? and a.aad203='02' and a.aad204=b.aac201")
	    			;
	      return this.queryForList(sql.toString(),this.get("aad301"));
	  }


	  public List<Map<String,String>> queryCollComp()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad201,a.aad203,b.aac301,b.aac302")
	    			.append("  from ad02 a,ac03 b")
	    			.append(" where a.aad301=? and a.aad203='03' and a.aad204=b.aac301")
	    			;
	      return this.queryForList(sql.toString(),this.get("aad301"));
	  }


	  public List<Map<String,String>> queryCollections()throws Exception
	  {

		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad301,a.aad302,a.aad303")
	    			.append("  from ad03 a")
	    			.append(" where a.aab101=?")
	    			;
	      return this.queryForList(sql.toString(), this.get("aab101"));
	  }


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


	  public boolean deleteColl()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("delete from ad03")
	    			.append(" where aad301=?")
	    			;
		  Object args[]={this.get("daad301")};
	      return this.executeUpdate(sql.toString(), args)>0;
	  }


	  public boolean createColl()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("insert into ad03(aab101,aad302,aad303)")
	    			.append("       values(?,?,?) ")
	    			;
		  Object args[]={this.get("aab101Self"),this.get("caad302"),getImg()};
	      return this.executeUpdate(sql.toString(), args)>0;
	  }
}

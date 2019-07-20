package com.neusoft.services.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.DBUtils;
import com.neusoft.system.tools.Tools;

public class Ac01ServicesImpl extends JdbcServicesSupport 
{
    //查询用料数
    public Map<String,String> findInsg()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select count(c.aac601) aac601count")
    			.append("  from ac06 c")
    			.append(" where c.aac101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aac101"));
    }
    //删除一行用料
    public boolean deleteInsg(Map<String,Object> dto,int i)throws Exception
    {
    	String sql="delete from ac06 where aac601=?";
    	System.out.println("8888888888");
    	System.out.println(dto.get(i+"aac601"));
    	return this.executeUpdate(sql, dto.get(i+"aac601"))>0;
    }
	//修改用料
	public boolean updateInsg(Map<String,Object> dto,int i)throws Exception
    {
		if(dto.get(i+"aac602")!=null&&dto.get(i+"aac603")!=null)
		{
			//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("update ac06 set aac602=?,aac603=?")
	    			.append(" where aac601=?")
	    			;
	    	//2.编写参数数组
	    	Object args[]={
	    			dto.get(i+"aac602"),
	    			dto.get(i+"aac603"),
	    			dto.get(i+"aac601")
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;
		}
		else
		{
			return deleteInsg(dto,i);
		}
    }
	
    //查询步骤数
    public Map<String,String> findStep()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select count(c.aac401) aac401count")
    			.append("  from ac04 c")
    			.append(" where c.aac101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aac101"));
    }
	//修改步骤
	public boolean updateStep(Map<String,Object> dto,int i)throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("update ac04 set aac402=?,aac403=?")
    			.append(" where aac401=?")
    			;
    	//2.编写参数数组
    	Object args[]={
    			dto.get(i+"aac402"),
    			dto.get("aac403"),
    			dto.get(i+"aac401"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
	//修改菜谱
    public boolean updateReci(Map<String,Object> dto)throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("update ac01 set aac102=?,aac104=NOW(),aac105=?,aac107=?,aac108=?")
    			.append(" where aac101=?")
    			;
    	//2.编写参数数组
    	Object args[]={
    			dto.get("aac102"),
    			dto.get("aac105"),
    			dto.get("aac107"),
    			dto.get("aac108"),
    			dto.get("aac101")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
	
    private Object[] xiaoxi(String msg)throws Exception
    {
    	//当前作品的用户号
    	String authorNumber = authorNumber();
    	//当前登录用户
    	String userName=userName();
    	String text=userName+msg;
    	Object args[]={authorNumber,text};
    	return args;
    }
	
    //获得菜谱的用户流水号
    private String authorNumber()throws Exception
    {
    	String sql="select aac106 from ac01 where aac101=? ";    	
    	Object args[]={this.get("aac101")};
    	return check(sql,args);
    }
    
    //获得当前用户的用户名
    private String userName()throws Exception
    {
    	//获取当前员工编号
    	String aab101="1";	
    	String sql="select aab102 from ab01 where aab101=? ";    	
    	Object args[]={aab101};
    	return check(sql,args);
    }

    private String check(String sql,Object args[])throws Exception
    {
    	List<Map<String,String>> rows = new ArrayList<>();
    	String value = null;
    	rows = this.queryForList(sql, args);
        for (Map<String, String> m :rows)
        {
            for(Map.Entry<String, String> vo : m.entrySet()){
                vo.getKey();
                value=vo.getValue();
            }
        }    	
    	return value;
    }
	
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
      //创建并插入收藏夹
      public boolean createColl()throws Exception
	  {
		  //当前用户流水号
		  String aab101="1";
		  StringBuilder sql=new StringBuilder()
	    			.append("insert into ad03(aab101,aad302,aad303)")
	    			.append("       values(?,?,?) ")
	    			;
		  Object args[]={aab101,this.get("caad302"),getImg()};
		  this.apppendSql(sql.toString(), args);
		  
		  int aad301=Tools.getSequence("aad301");
		  
	    	StringBuilder sql1=new StringBuilder()
	    			.append("insert into ad02(aad301,aad202,aad203,aad204)")
	    			.append("       values(?,NOW(),'01',?)")
	    			;
	    	Object args1[]={aad301,this.get("aac101")};
	    	this.apppendSql(sql1.toString(), args1);
	    	
	    	StringBuilder sql2=new StringBuilder()
	    			.append("update ac01 a")
	    			.append("   set a.aac110=a.aac110+1")
	    			.append(" where a.aac101=?")
	    			;
	    	Object args2[]={this.get("aac101")};
	    	this.apppendSql(sql2.toString(), args2);
		  
	      return this.executeTransaction();
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
	  
	//评论
	private boolean comment()throws Exception
    {
    	String aab101="1";
    	this.put("aab101", aab101);
    	
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ad04(aad402,aad403,aad404,aad405)")
    			.append("          values('01',?,?,?)")
    			;
    	Object args[]={this.get("aac101"),this.get("aad404"),aab101};
    	this.apppendSql(sql.toString(), args);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("insert into ab03(aab101,aab302,aab303,aab304)")
    			.append("          values(?,?,'00',NOW())")
    			;
    	Object args2[]=xiaoxi("评论了你的菜谱");
    	this.apppendSql(sql2.toString(), args2); 
    	
    	return this.executeTransaction();
    }
	
	//关注
	private boolean guanzhu()throws Exception
    {
		//当前账号用户
		String aab202="1";
		this.put("aab202", aab202);
    	
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ab02(aab202,aab203)")
    			.append("       values(?,?)")
    			;
    	Object args1[]={aab202,this.get("aac106")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	//当前用户关注数加1
    	StringBuilder sql2=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab107=a.aab107+1")
    			.append(" where a.aab101=?")
    			;
    	Object args2[]={aab202};
    	this.apppendSql(sql2.toString(), args2);
    	
    	//菜谱用户被关注数加1
    	StringBuilder sql3=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab108=a.aab108+1")
    			.append(" where a.aab101=?")
    			;
    	Object args3[]={this.get("aac106")};
    	this.apppendSql(sql3.toString(), args3);
    	
    	StringBuilder sql4=new StringBuilder()
    			.append("insert into ab03(aab101,aab302,aab303,aab304)")
    			.append("          values(?,?,'00',NOW())")
    			;
    	Object args4[]=xiaoxi("关注了你");
    	this.apppendSql(sql4.toString(), args4);
    	
    	return this.executeTransaction();
    }
	
	//取消关注
	private boolean cancleguanzhu()throws Exception
    {
		//当前账号用户
		String aab202="1";
		this.put("aab202", aab202);
    	
    	StringBuilder sql1=new StringBuilder()
    			.append("delete from ab02")
    			.append(" where aab202=? and aab203=?")
    			;
    	Object args1[]={aab202,this.get("aac106")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	//当前用户关注数减1
    	StringBuilder sql2=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab107=a.aab107-1")
    			.append(" where a.aab101=?")
    			;
    	Object args2[]={aab202};
    	this.apppendSql(sql2.toString(), args2);
    	
    	//菜谱用户被关注数减1
    	StringBuilder sql3=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab108=a.aab108-1")
    			.append(" where a.aab101=?")
    			;
    	Object args3[]={this.get("aac106")};
    	this.apppendSql(sql3.toString(), args3);
    	
    	return this.executeTransaction();
    }
	
    //判断是否关注 value不为空即已关注
	private String guanzhuNumber()throws Exception
	{
		//当前账号用户
		String aab202="1";
		this.put("aab202", aab202);
		
		List<Map<String,String>> rows = new ArrayList<>();
		
		String sql="select aab201 from ab02 where aab202=? and aab203=? ";
		Object args[]={aab202,this.get("aac106")};
		
		String aab201 = null;
		String value = null;
		rows = this.queryForList(sql, args);
	    for (Map<String, String> m :rows)
	    {
	        for(Map.Entry<String, String> vo : m.entrySet())
	        {
	            aab201=vo.getKey();
	            value=vo.getValue();
	        }
	    }    	
		return value;
	}
	
	//收藏
	private boolean shoucang()throws Exception
    {
		String aab101="1";
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad02(aad301,aad202,aad203,aad204)")
    			.append("       values(?,NOW(),'01',?)")
    			;
    	Object args1[]={this.get("aad301"),this.get("aac101")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac110=a.aac110+1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={this.get("aac101")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	StringBuilder sql3=new StringBuilder()
    			.append("insert into ab03(aab101,aab302,aab303,aab304)")
    			.append("          values(?,?,'00',NOW())")
    			;
    	Object args3[]=xiaoxi("收藏了你的作品");
    	this.apppendSql(sql3.toString(), args3);
    	
    	return this.executeTransaction();
    }
	
	//取消收藏
    private boolean cancleShoucang()throws Exception
    {
    	String sql1="delete from ad02 where aad201=? ";
    	Object args1[]={this.get("aad201")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac110=a.aac110-1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={this.get("aac101")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
	
    //判断是否收藏 value不为空即已收藏
	private String shoucangNumber()throws Exception
	{
		String aab101="1";
		List<Map<String,String>> rows = new ArrayList<>();
		
		StringBuilder sql=new StringBuilder()
		.append("select a.aad201")
		.append("  from ad02 a left join ad03 b on a.aad301=b.aad301")
		.append(" where b.aab101=? and a.aad204=?")
		;		

		Object args[]={aab101,this.get("aac101")};
		
		String aad201 = null;
		String value = null;
		rows = this.queryForList(sql.toString(), args);
	    for (Map<String, String> m :rows)
	    {
	        for(Map.Entry<String, String> vo : m.entrySet())
	        {
	            aad201=vo.getKey();
	            value=vo.getValue();
	        }
	    }    	
		return value;
	}
	
	//点赞
	private boolean giveLike()throws Exception
    {
    	String aab101="1";
    	this.put("aab101", aab101);
    	
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad01(aab101,aad102,aad103,aad104)")
    			.append("          values(?,NOW(),'01',?)")
    			;
    	Object args1[]={aab101,this.get("aac101")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac109=a.aac109+1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={this.get("aac101")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	StringBuilder sql3=new StringBuilder()
    			.append("insert into ab03(aab101,aab302,aab303,aab304)")
    			.append("          values(?,?,'00',NOW())")
    			;
    	Object args3[]=xiaoxi("给你的菜谱点了赞");
    	this.apppendSql(sql3.toString(), args3);
    	
    	return this.executeTransaction();
    }
	
	//取消点赞
    private boolean cancleLike()throws Exception
    {
    	String aab101="1";
    	this.put("aab101", aab101);
    	
    	String sql1="delete from ad01 where aad103='01' and aab101=? and aad104=? ";
    	Object args1[]={aab101,this.get("aac101")};
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
	
    //判断是否点赞 value不为空即已点赞
	private String likeNumber()throws Exception
	{ 
		//用户流水号
		String aab101="1";
		this.put("aab101", aab101);
		
		List<Map<String,String>> rows = new ArrayList<>();
		
		String sql="select aad101 from ad01 where aad103='01' and aad104=? and aab101=? ";
		
		Object args[]={this.get("aac101"),aab101};
		
		String aad101 = null;
		String value = null;
		rows = this.queryForList(sql, args);
	    for (Map<String, String> m :rows)
	    {
	        for(Map.Entry<String, String> vo : m.entrySet())
	        {
	            aad101=vo.getKey();
	            value=vo.getValue();
	        }
	    }    	
		return value;
	}

    //查询菜谱
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac101,a.aac102,date_format(a.aac103,'%Y-%m-%d') aac103,a.aac104,")
    			.append("       a.aac105,a.aac107,a.aac108,a.aac110,s.fvalue,b.aab102,b.aab106,a.aac106")
    			.append("  from ac01 a,ab01 b,syscode s")
    			.append(" where a.aac101=? and s.fcode=a.aac107 and b.aab101=a.aac106")
    			;
    	//执行查询
    	Map<String,String> recidto = this.queryForMap(sql.toString(), this.get("aac101"));
    	this.put("aac106", recidto.get("aac106"));
    	
    	String likeNumber=likeNumber();
    	recidto.put("aad101", likeNumber);
    	String shoucangNumber=shoucangNumber();
    	recidto.put("aad201", shoucangNumber);
    	String guanzhuNumber=guanzhuNumber();
    	recidto.put("aab201", guanzhuNumber);
    	
    	Map<String,String> pro=findPro();
    	String pronum=pro.get("pronum");
    	recidto.put("pronum", pronum);
    	Map<String,String> insg=findInsg();
    	String aac601count=insg.get("aac601count");
    	recidto.put("aac601count", aac601count);
    	Map<String,String> step=findStep();
    	String aac401count=step.get("aac401count");
    	recidto.put("aac401count", aac401count);
    	return recidto;
    }
    
    //查询作品数
    public Map<String,String> findPro()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select count(c.aac201) pronum")
    			.append("  from ac01 a,ac02 c")
    			.append(" where a.aac101=? and a.aac101=c.aac207")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aac101"));
    }

      //查询步骤
	  public List<Map<String,String>> querySteps()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac401,a.aac402,a.aac403,a.aac404")
	    			.append("  from ac04 a")
	    			.append(" where a.aac101=? order by a.aac404 asc")
	    			;
	    	return this.queryForList(sql.toString(), this.get("aac101"));
	  }
	  
	  //查询用料
	  public List<Map<String,String>> query()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac601,a.aac602,a.aac603")
	    			.append("  from ac06 a")
	    			.append(" where a.aac101=?")
	    			;
	    	return this.queryForList(sql.toString(), this.get("aac101"));
	  }
	  
	  //查询作品
	  public List<Map<String,String>> queryPro()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac203,a.aac204")
	    			.append("  from ac02 a")
	    			.append(" where a.aac207=? limit 4")
	    			;
	    	return this.queryForList(sql.toString(), this.get("aac101"));
	  }
    
	  //查询点赞
	  public List<Map<String,String>> queryLike()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select b.aab106")
	    			.append("  from ad01 a,ab01 b")
	    			.append(" where a.aad103='01' and a.aad104=? and a.aab101=b.aab101")
	    			;
	    	return this.queryForList(sql.toString(), this.get("aac101"));
	  }
	  
	  //查询评论
	  public List<Map<String,String>> queryComment()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aad404,b.aab106,b.aab102")
	    			.append("  from ad04 a,ab01 b")
	    			.append(" where a.aad402='01' and a.aad403=? and a.aad405=b.aab101")
	    			;
	    	return this.queryForList(sql.toString(), this.get("aac101"));
	  }
	    //删除菜谱
	    public boolean deleteById()throws Exception
	    {
	    	String sql="delete from ac01 where aac101=?";
	    	return this.executeUpdate(sql, this.get("aac101"))>0;
	    }
	    
		//添加用料
		public boolean addInsg(Map<String,Object> dto,int i)throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ac06(aac101,aac602,aac603)")
	    			.append("          values(?,?,?)")
	    			;
	    	//2.编写参数数组
	    	Object args[]={
	    			dto.get("aac101"),
	    			dto.get(i+"aac602"),
	    			dto.get(i+"aac603")
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
		
		//添加步骤
		public boolean addStep(Map<String,Object> dto,int i)throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ac04(aac101,aac402,aac403,aac404)")
	    			.append("          values(?,?,?,?)")
	    			;
	    	//2.编写参数数组
	    	Object args[]={
	    			dto.get("aac101"),
	    			dto.get(i+"aac402"),
	    			dto.get("aac403"),
	    			dto.get(i+"aac404")
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
		
		//添加菜谱
	    public boolean addReci(Map<String,Object> dto)throws Exception
	    {
	        //aac106 当前用户流水号
	    	String aac106="1";
	        
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ac01(aac102,aac103,aac104,aac105,aac106,")
	    			.append("                 aac107,aac108,aac109,aac110)")
	    			.append("          values(?,NOW(),null,?,?,")
	    			.append("                 ?,?,'0','0')")
	    			;
	    	//2.编写参数数组
	    	Object args[]={
	    			dto.get("aac102"),
	    			dto.get("aac105"),
	    			aac106,
	    			dto.get("aac107"),
	    			dto.get("aac108")
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
}

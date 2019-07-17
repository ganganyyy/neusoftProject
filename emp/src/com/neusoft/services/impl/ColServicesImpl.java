package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class ColServicesImpl extends JdbcServicesSupport 
{
      //��ѯ�ղؼ�
	  public List<Map<String,String>> queryCollections()throws Exception
	  {
		  //��ǰ�û���ˮ��
		  String aab101="1";
		  StringBuilder sql=new StringBuilder()
	    			.append("select a.aad301,a.aad302,a.aad303")
	    			.append("  from ad03 a")
	    			.append(" where a.aab101=?")
	    			;
	      return this.queryForList(sql.toString(), aab101);
	  }
	  
      //�ղؼ�������
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
	  
      //ɾ���ղؼ�
	  public boolean deleteColl()throws Exception
	  {
		  StringBuilder sql=new StringBuilder()
	    			.append("delete from ad03")
	    			.append(" where aad301=?")
	    			;
		  Object args[]={this.get("daad301")};
	      return this.executeUpdate(sql.toString(), args)>0;
	  }

      //�����ղؼ�
	  public boolean createColl()throws Exception
	  {
		  //��ǰ�û���ˮ��
		  String aab101="1";
		  StringBuilder sql=new StringBuilder()
	    			.append("insert into ad03(aab101,aad302,aad303)")
	    			.append("       values(?,?,?) ")
	    			;
		  Object args[]={aab101,this.get("caad302"),"img/1.jpg"};
	      return this.executeUpdate(sql.toString(), args)>0;
	  }
}

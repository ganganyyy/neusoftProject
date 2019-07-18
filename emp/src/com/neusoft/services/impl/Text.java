package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Text extends JdbcServicesSupport 
{
    private Object[] xiaoxi(String msg)throws Exception
    {
    	//��ǰ��Ʒ���û���
    	String authorNumber = authorNumber();
    	//��ǰ��¼�û�
    	String userName=userName();
    	String text=userName+msg;
    	Object args[]={authorNumber,text};
    	return args;
    }
	
    //�����Ʒ���û���ˮ��
    private String authorNumber()throws Exception
    {
    	String sql="select aab101 from ac02 where aac201=? ";    	
    	Object args[]={this.get("aac201")};
    	return check(sql,args);
    }
    
    //��õ�ǰ�û����û���
    private String userName()throws Exception
    {
    	//��ȡ��ǰԱ�����
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

}

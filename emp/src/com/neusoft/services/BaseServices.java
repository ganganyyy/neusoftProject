package com.neusoft.services;

import java.util.List;
import java.util.Map;

public interface BaseServices 
{
     void setMapDto(Map<String,Object> dto);
     
     /**
      * �ӿڵ�Ĭ��ʵ��
      * @return
      * @throws Exception
      */
     default Map<String,String> findById()throws Exception
     {
    	 return null;
     }
     
     default List<Map<String,String>> query()throws Exception
     {
    	 return null;
     }
     
     //dsy ��ѯ����
     default List<Map<String,String>> querySteps()throws Exception
     {
    	 return null;
     }
     
     //dsy ��ѯ��Ʒ
     default List<Map<String,String>> queryPro()throws Exception
     {
    	 return null;
     }
     
     //dsy ��ѯ����
     default List<Map<String,String>> queryLike()throws Exception
     {
    	 return null;
     }
     
     //dsy ��ѯ����
     default List<Map<String,String>> queryComment()throws Exception
     {
    	 return null;
     }
     
}

package com.neusoft.services;

import java.util.List;
import java.util.Map;

public interface BaseServices 
{
     void setMapDto(Map<String,Object> dto);
     
     /**
      * 接口的默认实现
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
     
     //dsy 查询步骤
     default List<Map<String,String>> querySteps()throws Exception
     {
    	 return null;
     }
     
     //dsy 查询作品
     default List<Map<String,String>> queryPro()throws Exception
     {
    	 return null;
     }
     
     //dsy 查询点赞
     default List<Map<String,String>> queryLike()throws Exception
     {
    	 return null;
     }
     
     //dsy 查询评论
     default List<Map<String,String>> queryComment()throws Exception
     {
    	 return null;
     }
     
}

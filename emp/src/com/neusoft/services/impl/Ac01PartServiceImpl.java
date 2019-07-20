package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.ansj.domain.Result;
import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.ToAnalysis;

import com.neusoft.services.JdbcServicesSupport;

/**
 * 
 * ��������ac01��
 * ��ҳģ��
 * @author gangan
 *
 */
public class Ac01PartServiceImpl extends JdbcServicesSupport {

	/**
	 * ��ѯ��������
	 * inputHunt:�û�����
	 * huntOption���û�ѡ�����������
	 * 
	 */
	public  List<Map<String,String>> queryForOption()throws Exception
	{
		String inputHunt=(String) this.get("inputHunt");
		System.out.println("inputHunt: "+inputHunt);
		String huntOption=getOption().get("huntOption");
		System.out.println(huntOption);
		//�ִʽ������keyList
		List<String>keyList=this.getKeyWords(inputHunt);
		if(huntOption.equals("ab01"))
		{
			
			//�����û�
			return this.queryForAb01(keyList);
		}
		else if(huntOption.equals("ac01"))
		{
			System.out.println("�������ݣ�"+this.queryForAc01(keyList));
			//����ʳ�ױ�
			return this.queryForAc01(keyList);
		}
		else
		{
			return new ArrayList<Map<String,String>>();
		}
	}
	
	/**
	 * ��ȡ��������
	 * �û���ab01
	 * ʳ�ף�ac01
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getOption()throws Exception
	{
		String huntOption=(String)this.get("huntOption");
		Map<String,String>info=new HashMap<>();
		info.put("huntOption", huntOption);
		return info;
	}
	
	/**
	 * ���ݷִʽ����ѯ�����û�
	 * ����������ѯ
	 * @param keyList���ִʽ��
	 * ac01Count:���û���������ʳ����
	 * ac02Count:���û�����������Ʒ��
	 * @return
	 * @throws Exception
	 */
	public  List<Map<String,String>> queryForAb01(List<String>keyList)throws Exception
	{
		/*StringBuilder sql=new StringBuilder()
				.append("select aab101,aab102,aab106,count(aab203) as statistic")
				.append("from ab01 u left JOIN ab02 s on u.aab101=s.aab203 where u.aab102 like ?")
				.append("group by aab101")
				.append("order by statistic desc;");*/
		
		StringBuilder sql=new StringBuilder()
				.append("select u.aab101,aab102,aab106,aab107,aab108,")
				.append("       count(aac106) as ac01Count ,count(w.aab101) as ac02Count")
				.append("  from ab01 u left join ac01 v on u.aab101=v.aac106 ")
			    .append("       left join ac02 w on u.aab101=w.aab101")
		        .append("       where 0");
		
		List<Object> paramList=new ArrayList<>();
		for(String key:keyList)
		{
			sql.append("        or u.aab102 like ?");
			paramList.add("%"+key+"%");
		}
		sql.append("       group by aab101;");
		
		return this.queryForList(sql.toString(), paramList.toArray());
		
	}

	/**
	 * ���ݷִʽ����ѯ����ʳ��
	 * ����������ѯ
	 * @param keyList���ִʽ��
	 * ingredientStr:ƴ�ӵ����������ֶ�
	 * @return
	 * @throws Exception
	 */
	public  List<Map<String,String>> queryForAc01(List<String>keyList)throws Exception
	{
		
		StringBuilder sql=new StringBuilder()
				.append("select u.aac101,aac102,aac108,aac109,aac110,")
				.append("       aab102,GROUP_CONCAT(aac603) as ingredientStr")
				.append("  from ac01 u left join ab01 v on u.aac106=v.aab101")
				.append("       left join ac06 w on u.aac101=w.aac101")
				.append("       GROUP BY u.aac101")
				.append("       having 0 ");
		
		
		List<Object> paramList=new ArrayList<>();
		for(String key:keyList)
		{
			sql.append(" or aac102 like ? or ingredientStr like ?");
			paramList.add("%"+key+"%");
			paramList.add("%"+key+"%");
		}
		sql.append(";");
		
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	
	/**
	 * ��ѯ�������ʳ��
	 * ac02Count��ʳ�׶�Ӧ������Ʒ��
	 * @return
	 * @throws Exception
	 */
	public  List<Map<String,String>> queryForLatestMenu()throws Exception
	{
		System.out.println("session�л�ȡ��ˮ�ţ�"+this.get("aab101Self"));
		
		StringBuilder sql=new StringBuilder()
				.append("select u.aac101,u.aac102,u.aac103,u.aac108,v.aab102,count(w.aac207) as ac02Count")
				.append("  from ac01 u left join ab01 v on u.aac106=v.aab101")
				.append("  left join ac02 w on u.aac101=w.aac207")
				.append("  group by u.aac101")
				.append("  order by ac02Count desc");
		return this.queryForList(sql.toString());
		
	}
	
	
	/**
	 * ʳ�����а�
	 * ���ֱ�׼���ղ���:0|������:1
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>>queryForPopularMenu()throws Exception
	{
		String option=(String)this.get("option");
		if(option.equals("0"))
		{
			//��ѯ�ղ����а�
			return this.queryForPopularMenuByAd02();
		}
		else if(option.equals("1"))
		{
			//��ѯ�������а�
			return this.queryForPopulatMenuByAd01();
		}
		else
		{
			return new ArrayList<Map<String,String>>();
		}
		
	}
	/**
	 * �����ղز�ѯʳ��
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>>queryForPopularMenuByAd02()throws Exception
	{
		StringBuilder sql=new StringBuilder()
					.append("select aac101,aac102,aac108,aac110,aab101,aab102")
					.append("  from ac01 u left join ab01 v on u.aac106=v.aab101")
					.append("  order by aac110 desc;");

		return this.queryForList(sql.toString());
	}
	
	/**
	 * ���ݵ����ղ�ʳ��
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>>queryForPopulatMenuByAd01()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select aac101,aac102,aac108,aac109,aab101,aab102")
				.append("  from ac01 u left join ab01 v on u.aac106=v.aab101")
				.append("  order by aac109 desc;");
		
		return this.queryForList(sql.toString());
	}
	
	
	/**
	 * �����������зִ�
	 * @param input
	 * @return
	 */
	private List<String>getKeyWords(String input)
	{
		 //ֻ��ע��Щ���ԵĴ�
		 HashSet<String> expectedNature = new HashSet<String>() {{
	            add("n");add("v");add("vd");add("vn");add("vf");
	            add("vx");add("vi");add("vl");add("vg");
	            add("nt");add("nz");add("nw");add("nl");
	            add("ng");add("userDefine");add("wh");add("en");
	        }};
	        
		 List<String> keyList=new ArrayList();
		
		//�ִʽ����һ����װ����Ҫ��һ��List<Term>��terms
		 Result result = ToAnalysis.parse(input);
	     //System.out.println(result.getTerms());
		 List<Term> terms = result.getTerms(); //�õ�terms
	     //System.out.println(terms.size());
	     for(int i=0; i<terms.size(); i++) {
	          String word = terms.get(i).getName(); //�õ���
	          String natureStr = terms.get(i).getNatureStr(); //�õ�����
	          //TODO:��ȷ���費��Ҫ��Ӣ���ٷֳɵ�����ĸ 
	          if(expectedNature.contains(natureStr)) {
	        	 if(natureStr.equals("en"))
	        	 {	
	        		char[] list= word.toCharArray();
	        		System.out.println("list:"+list);
	        		for(char item:list)
	        		{
	        			keyList.add(item+"");
	        		}
	        	 }
	        	 else
	        	 {
		             System.out.println(word + ":" + natureStr);
		             keyList.add(word);
	        	 }
	          }
	     }
		return keyList;
	}
	
	
	
}

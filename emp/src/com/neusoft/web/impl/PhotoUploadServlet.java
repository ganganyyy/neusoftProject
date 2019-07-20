package com.neusoft.web.impl;

import com.google.gson.Gson;
import com.neusoft.services.BaseServices;
import com.neusoft.system.db.DBUtils;

import java.io.*;
import java.sql.PreparedStatement;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * �ϴ��û�ͷ��
 * @author ���ɺ
 */
@WebServlet("/uploadPhoto")
public class PhotoUploadServlet extends HttpServlet{

    protected String processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        PrintWriter pw = response.getWriter();
        
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        String result = "";
        
    
        //�ϴ��ļ��ı���Ŀ¼
        String savePath = "C:\\Users\\HP\\Documents\\GitHub\\neusoftProject\\emp\\WebRoot\\images";
        //�ϴ�ʱ���ɵ���ʱ�ļ�����Ŀ¼
        String tempPath = "D:\\testImage\\tmp";

        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //������ʱĿ¼
            tmpFile.mkdir();
        }

        //ʹ��Apache�ļ��ϴ���������ļ��ϴ����裺
        //1������һ��DiskFileItemFactory����
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //���ù����Ļ������Ĵ�С�����ϴ����ļ���С�����������Ĵ�Сʱ���ͻ�����һ����ʱ�ļ���ŵ�ָ������ʱĿ¼���С�
        factory.setSizeThreshold(1024 * 1024 * 10);//���û������Ĵ�СΪ10M�������ָ������ô�������Ĵ�СĬ����10KB
        //�����ϴ�ʱ���ɵ���ʱ�ļ��ı���Ŀ¼
        factory.setRepository(tmpFile);

        //2������һ���ļ��ϴ�������
        ServletFileUpload upload = new ServletFileUpload(factory);

        //����ϴ��ļ�������������
        upload.setHeaderEncoding("UTF-8");
        //3���ж��ύ�����������Ƿ����ϴ���������
//        if (!ServletFileUpload.isMultipartContent(request)) {
//            //���մ�ͳ��ʽ��ȡ����
//            return ;
//        }

        //�����ϴ������ļ��Ĵ�С�����ֵ��Ŀǰ������Ϊ1024*1024*10�ֽڣ�Ҳ����10MB
        upload.setFileSizeMax(1024 * 1024 * 10);
        //�����ϴ��ļ����������ֵ�����ֵ=ͬʱ�ϴ��Ķ���ļ��Ĵ�С�����ֵ�ĺͣ�Ŀǰ����Ϊ10MB
        upload.setSizeMax(1024 * 1024 * 10);

        //4��ʹ��ServletFileUpload�����������ϴ����ݣ�����������ص���һ��List<FileItem>���ϣ�ÿһ��FileItem��Ӧһ��Form����������
        List<FileItem> list = null;
        try {
            list = upload.parseRequest(request);
            for (FileItem item : list) {
                //���fileitem�з�װ������ͨ�����������
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //�����ͨ����������ݵ�������������
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
//                   System.out.println(name + "=" + value);
                    resultMap.put(name, value);
                } else {//���fileitem�з�װ�����ϴ��ļ�
                    //�õ��ϴ����ļ����ƣ�
                    String filename = item.getName();
//                    System.out.println(filename);
                    
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }

                    //ע�⣺��ͬ��������ύ���ļ����ǲ�һ���ģ���Щ������ύ�������ļ����Ǵ���·���ģ��磺  c:\a\b\1.txt������Щֻ�ǵ������ļ������磺1.txt
                    //�����ȡ�����ϴ��ļ����ļ�����·�����֣�ֻ�����ļ�������
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    //�õ��ϴ��ļ�����չ��
                    String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
                    //�����Ҫ�����ϴ����ļ����ͣ���ô����ͨ���ļ�����չ�����ж��ϴ����ļ������Ƿ�Ϸ�
//                    System.out.println("�ϴ����ļ�����չ���ǣ�" + fileExtName);
                    //��ȡitem�е��ϴ��ļ���������
                    InputStream in = item.getInputStream();
                            
                    //�õ��ļ����������
                    String saveFilename = makeFileName(filename);
                    //�õ��ļ��ı���Ŀ¼
                    String realSavePath = savePath+makePath(saveFilename, savePath);
                    String str = makePath(saveFilename, savePath)+"\\"+saveFilename;
                   /**
                    * ��������ڴ�����ݿ�ĵ�ַ,�����ʵ��޸�ǰ׺,�����ڵ�ǰ�����µ�images�ļ�����
                    */
                    String mapFilename ="images"+str.replaceAll("\\\\", "/");
                    resultMap.put("fileName", mapFilename);
                    //����һ���ļ������
                    FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
                    
                    //resultMap.put("filename", realSavePath+"\\"+saveFilename);
                    //����һ��������
                    byte buffer[] = new byte[1024];
                    //�ж��������е������Ƿ��Ѿ�����ı�ʶ
                    int len = 0;
                    //ѭ�������������뵽���������У�(len=in.read(buffer))>0�ͱ�ʾin���滹������
                    while ((len = in.read(buffer)) > 0) {
                        //ʹ��FileOutputStream�������������������д�뵽ָ����Ŀ¼(savePath + "\\" + filename)����
                        out.write(buffer, 0, len);
                    }
                    //�ر�������
                    in.close();
                    //�ر������
                    out.close();
                    //ɾ�������ļ��ϴ�ʱ���ɵ���ʱ�ļ�
                    item.delete();
                    
                    //resultMap.put("no", 1);
                    resultMap.put("msg", "ͷ���ϴ��ɹ���");
                    resultMap.put("uuid", UUID.randomUUID().toString().replaceAll("-", ""));
                    
                    result = new Gson().toJson(resultMap);
                    
                }
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
        	
            pw.print(result);
           
        }
		return result;

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try
    	{
    	
   
    	
        String gsonString=processRequest(request, response);
        //Map<String,Object> map = new HashMap<String, Object>();
        dto = new Gson().fromJson(gsonString,Map.class);
        String aab101Self=(String) request.getSession().getAttribute("aab101Self");
       this.setMapDto(dto);
       this.dto.put("aab101Self", aab101Self);
        this.addPhoto();

        request.getRequestDispatcher("/QueryMessage.html?aab101="+aab101Self).forward(request, response);
     
       
        
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	}
   
    private Map<String,Object> dto=null;
    private boolean addPhoto() throws Exception
	{
		
		String sql = "update ab01 set aab106=? where aab101=?";
		Object args[]={
			this.dto.get("fileName"),
			this.dto.get("aab101Self")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	/**
	 * ΪServices����DTO
	 * @param dto
	 */
    protected final int executeUpdate(final String sql,final Object...args)throws Exception
	{
		//1.����JDBC�ӿڱ���
		PreparedStatement pstm=null;
		try
		{
			//3.����SQL
			pstm=DBUtils.prepareStatement(sql);
			//4.������ֵ
			int index=1;
			for(Object param:args)
			{
				pstm.setObject(index++, param);
			}
			//5.ִ��SQL���
			return pstm.executeUpdate();
		}
		finally
		{
			DBUtils.close(pstm);
		}
	}
    
	public void setMapDto(Map<String, Object> dto)
	{
	    this.dto=dto;	
	}
    
    private String makeFileName(String filename){ 
        //Ϊ��ֹ�ļ����ǵ���������ҪΪ�ϴ��ļ�����һ��Ψһ���ļ���
        return UUID.randomUUID().toString() + "_" + filename;
    }
    
    private String makePath(String filename,String savePath){
        //�õ��ļ�����hashCode��ֵ���õ��ľ���filename����ַ����������ڴ��еĵ�ַ
        int hashcode = filename.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //�����µı���Ŀ¼
        String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
        String forMap="\\"+dir1+"\\"+dir2;
       
        //File�ȿ��Դ����ļ�Ҳ���Դ���Ŀ¼
        File file = new File(dir);
        //���Ŀ¼������
        if(!file.exists()){
            //����Ŀ¼
            file.mkdirs();
        }
        return forMap;
    }
    
}
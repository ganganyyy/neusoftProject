package basic;

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

@WebServlet("/uploadPhoto")
public class PhotoUploadServer extends HttpServlet{

    protected String processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        PrintWriter pw = response.getWriter();
        
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        String result = "";
        
        //上传文件的保存目录
        String savePath = "D:\\work\\empMerge\\WebRoot\\img\\head";
        //上传时生成的临时文件保存目录
        String tempPath = "D:\\testImage\\tmp";

        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }

        //使用Apache文件上传组件处理文件上传步骤：
        //1、创建一个DiskFileItemFactory工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
        factory.setSizeThreshold(1024 * 1024 * 10);//设置缓冲区的大小为10M，如果不指定，那么缓冲区的大小默认是10KB
        //设置上传时生成的临时文件的保存目录
        factory.setRepository(tmpFile);

        //2、创建一个文件上传解析器
        ServletFileUpload upload = new ServletFileUpload(factory);

        //解决上传文件名的中文乱码
        upload.setHeaderEncoding("UTF-8");
        //3、判断提交上来的数据是否是上传表单的数据
//        if (!ServletFileUpload.isMultipartContent(request)) {
//            //按照传统方式获取数据
//            return ;
//        }

        //设置上传单个文件的大小的最大值，目前是设置为1024*1024*10字节，也就是10MB
        upload.setFileSizeMax(1024 * 1024 * 10);
        //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
        upload.setSizeMax(1024 * 1024 * 10);

        //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
        List<FileItem> list = null;
        try {
            list = upload.parseRequest(request);
            for (FileItem item : list) {
                //如果fileitem中封装的是普通输入项的数据
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
//                   System.out.println(name + "=" + value);
                    resultMap.put(name, value);
                } else {//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String filename = item.getName();
//                    System.out.println(filename);
                    
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }

                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    //得到上传文件的扩展名
                    String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
                    //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
//                    System.out.println("上传的文件的扩展名是：" + fileExtName);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                            
                    //得到文件保存的名称
                    String saveFilename = makeFileName(filename);
                    //得到文件的保存目录
                    String realSavePath = savePath+makePath(saveFilename, savePath);
                    String str = makePath(saveFilename, savePath)+"\\"+saveFilename;
                   /**
                    * 这个是用于存进数据库的地址,可以适当修改前缀,这是在当前工程下的images文件夹里
                    */
                    String mapFilename ="images"+str.replaceAll("\\\\", "/");
                    resultMap.put("fileName", mapFilename);
                    //创建一个文件输出流
                    FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
                    
                    //resultMap.put("filename", realSavePath+"\\"+saveFilename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while ((len = in.read(buffer)) > 0) {
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除处理文件上传时生成的临时文件
                    item.delete();
                    
                    //resultMap.put("no", 1);
                    resultMap.put("msg", "头像上传成功！");
                    resultMap.put("uuid", UUID.randomUUID().toString().replaceAll("-", ""));
                    
                    result = new Gson().toJson(resultMap);
                    
                }
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(FileUploadServer.class.getName()).log(Level.SEVERE, null, ex);
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

        request.getRequestDispatcher("message.jsp").forward(request, response);
     
       
        
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
	 * 为Services传递DTO
	 * @param dto
	 */
    protected final int executeUpdate(final String sql,final Object...args)throws Exception
	{
		//1.定义JDBC接口变量
		PreparedStatement pstm=null;
		try
		{
			//3.编译SQL
			pstm=DBUtils.prepareStatement(sql);
			//4.参数赋值
			int index=1;
			for(Object param:args)
			{
				pstm.setObject(index++, param);
			}
			//5.执行SQL语句
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
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        return UUID.randomUUID().toString() + "_" + filename;
    }
    
    private String makePath(String filename,String savePath){
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        int hashcode = filename.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //构造新的保存目录
        String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
        String forMap="\\"+dir1+"\\"+dir2;
       
        //File既可以代表文件也可以代表目录
        File file = new File(dir);
        //如果目录不存在
        if(!file.exists()){
            //创建目录
            file.mkdirs();
        }
        return forMap;
    }
    
}
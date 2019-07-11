package basic;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class FileUtil {

    //设置允许接收的文件的格式，我这里设置为只能是图片
    private static final String ALLWED_IMAGE_TYPE ="png,jpg,gif,jpeg";

    public static Map<String,Object> upload(HttpServletRequest req) 
    {
        //解析和检查请求，是否是post方式，默认是二进制流格式
        Boolean isMultipart=ServletFileUpload.isMultipartContent(req);
        String imgPath="";
        List<String> imageList = new ArrayList<>();
        Map<String,Object> dto=new HashMap<>();
        if (!isMultipart) 
        {
            return null; //如果不是就不用上传了
        }
        try 
        {
            //创建FileItemFactory对象
            FileItemFactory factory=new DiskFileItemFactory();
            //设置缓存区大小,默认大小是10kb，
            ((DiskFileItemFactory) factory).setSizeThreshold(20*1024);
            //设置临时目录，默认是Tomcat下的temp，不建议设置
            //((DiskFileItemFactory) factory).setRepository(临时目录不建议修改);

            //创建文件上传的处理器
            ServletFileUpload upload=new ServletFileUpload(factory);
            //解析请求
            List<FileItem> items=upload.parseRequest(req);
            //迭代出每一个FileItem
            
            for (FileItem item : items) 
            {
                String fileName = item.getFieldName();
                if (item.isFormField()) 
                {
                    //普通的表单控件
                    String value = item.getString("GBK");
                    dto.put(fileName, value);
                    //System.out.println(fileName + "->" + value);
                } 
                else 
                {
                    //----------------先获取上传文件的拓展名
                    String ext = FilenameUtils.getExtension(item.getName());
                    String [] allowedImagetype=ALLWED_IMAGE_TYPE.split(",");
                    //-----------------判断上传文件的拓展名在不在我设定的范围之内,不在的话提醒并且结束方法
                    if (!Arrays.asList(allowedImagetype).contains(ext)) 
                    {
                        throw  new LogicException("你上传的不是图片，请重新上传图片");
                    }

                    //上传文件的控件
                    String RandomName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(item.getName());
                    //System.out.println(fileName + "->" + FilenameUtils.getName(item.getName())); //一个的标签的name，一个是文件的name
                    //String path=req.getServletContext().getRealPath("/img");
                    
                    String path="D:/github/neusoftProject/emp/WebRoot/img";//路径根据需求更改
                    
                    item.write(new File(path, RandomName)); //把上传的文件保存到某个文件中
                    
                    imgPath="img/"+RandomName;
                    imageList.add(imgPath);
                    //System.out.println(item.isInMemory());//判断文件资源是否在内存中
                } 
                dto.put("imageList", imageList);
            } 
        }
        //Exception会捕捉我们的LogicException异常提示，所以我们在上面写一个，便于把LogicException异常返回给Servlet
        catch (LogicException e)
        {
            throw e;
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
		return dto;
    }
}

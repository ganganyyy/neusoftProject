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

public class FileUtil 
{
    private static final String ALLWED_IMAGE_TYPE ="png,jpg,gif,jpeg";

    public static Map<String,Object> upload(HttpServletRequest req) 
    {
        Boolean isMultipart=ServletFileUpload.isMultipartContent(req);
        String imgPath="";
        List<String> imageList = new ArrayList<>();
        Map<String,Object> dto=new HashMap<>();
        if (!isMultipart) 
        {
            return null;
        }
        try 
        {
            FileItemFactory factory=new DiskFileItemFactory();
            ((DiskFileItemFactory) factory).setSizeThreshold(20*1024);
            
            ServletFileUpload upload=new ServletFileUpload(factory);
            
            List<FileItem> items=upload.parseRequest(req);
            
            for (FileItem item : items) 
            {
                String fileName = item.getFieldName();
                
                if (item.isFormField()) 
                {
                    String value = item.getString("GBK");
                    dto.put(fileName, value);
                    //System.out.println(fileName + "->" + value);
                } 
                else 
                {
                    String ext = FilenameUtils.getExtension(item.getName());
                    String [] allowedImagetype=ALLWED_IMAGE_TYPE.split(",");
                    if (!Arrays.asList(allowedImagetype).contains(ext)) 
                    {
                        throw  new LogicException("false");
                    }

                    String RandomName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(item.getName());
                    //System.out.println(fileName + "->" + FilenameUtils.getName(item.getName()));
                    //String path=req.getServletContext().getRealPath("/img");
                    
                    String path="D:/github/neusoftProject/emp/WebRoot/img";
                    
                    item.write(new File(path, RandomName));
                    
                    imgPath="img/"+RandomName;
                    imageList.add(imgPath);
                    //System.out.println(item.isInMemory());
                } 
                dto.put("imageList", imageList);
            } 
        }
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

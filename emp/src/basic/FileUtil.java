package basic;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

public class FileUtil {

    //����������յ��ļ��ĸ�ʽ������������Ϊֻ����ͼƬ
    private static final String ALLWED_IMAGE_TYPE ="png,jpg,gif,jpeg";

    public static void upload(HttpServletRequest req) {

        //�����ͼ�������Ƿ���post��ʽ��Ĭ���Ƕ���������ʽ
        Boolean isMultipart=ServletFileUpload.isMultipartContent(req);
        if (!isMultipart) {
            return; //������ǾͲ����ϴ���
        }
        try {
            //����FileItemFactory����
            FileItemFactory factory=new DiskFileItemFactory();
            //���û�������С,Ĭ�ϴ�С��10kb��
            ((DiskFileItemFactory) factory).setSizeThreshold(20*1024);
            //������ʱĿ¼��Ĭ����Tomcat�µ�temp������������
            //((DiskFileItemFactory) factory).setRepository(��ʱĿ¼�������޸�);

            //�����ļ��ϴ��Ĵ�����
            ServletFileUpload upload=new ServletFileUpload(factory);
            //��������
            List<FileItem> items=upload.parseRequest(req);
            //������ÿһ��FileItem
            for (FileItem item : items) {
                String fileName = item.getFieldName();
                if (item.isFormField()) {
                    //��ͨ�ı��ؼ�
                    String value = item.getString("utf-8");
                    System.out.println(fileName + "->" + value);
                } else {
                    //----------------�Ȼ�ȡ�ϴ��ļ�����չ��
                    String ext = FilenameUtils.getExtension(item.getName());
                    String [] allowedImagetype=ALLWED_IMAGE_TYPE.split(",");
                    //-----------------�ж��ϴ��ļ�����չ���ڲ������趨�ķ�Χ֮��,���ڵĻ����Ѳ��ҽ�������
                    if (!Arrays.asList(allowedImagetype).contains(ext)) {
                        throw  new LogicException("���ϴ��Ĳ���ͼƬ���������ϴ�ͼƬ");
                    }


                    //�ϴ��ļ��Ŀؼ�
                    String RandomName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(item.getName());
                    System.out.println(fileName + "->" + FilenameUtils.getName(item.getName())); //һ���ı�ǩ��name��һ�����ļ���name
                    String path=req.getServletContext().getRealPath("/img");
                    System.out.println(path);
                    item.write(new File(path, RandomName)); //���ϴ����ļ����浽ĳ���ļ���
                    //System.out.println(item.isInMemory());//�ж��ļ���Դ�Ƿ����ڴ���
                }
            }

        }
        //Exception�Ჶ׽���ǵ�LogicException�쳣��ʾ����������������дһ�������ڰ�LogicException�쳣���ظ�Servlet
        catch (LogicException e){
            throw e;
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }

}

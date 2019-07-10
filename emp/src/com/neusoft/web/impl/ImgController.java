package com.neusoft.web.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/upload")
public class ImgController extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException 
	{		
		req.getRequestDispatcher("/WEB-INF/upfile.jsp").forward(req, resp);	
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
 
		req.setAttribute("message", "");
		req.setAttribute("path", "");
		String filename = null;
		// �����ϴ�ͼƬ�ı���·��
		String savePath = this.getServletContext().getRealPath("/images");
		File file = new File(savePath);
		// �ж��ϴ��ļ��ı���Ŀ¼�Ƿ����
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savePath + "Ŀ¼�����ڣ���Ҫ����");
			// ����Ŀ¼
			file.mkdir();
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2������һ���ļ��ϴ�������
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		// 3���ж��ύ�����������Ƿ����ϴ���������
		if (!ServletFileUpload.isMultipartContent(req)) {
			// ���մ�ͳ��ʽ��ȡ����
			return;
		}
		try {
			List<FileItem> list = upload.parseRequest(req);
			System.out.println(list.toString());// �ļ���·�� �Լ������·��
			for (FileItem item : list) {
				 filename = item.getName();// ���һ������ļ�����
				if (filename == null || filename.trim().equals("")) {// �����Մt���^
					continue;
				}
				// ���e ��Ҫ�^�V�ļ����Q java.io.FileNotFoundException:
				// G:\����02\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FaceUp\WEB-INF\images\C:\Users\Ray\Pictures\2.jpeg
				// (�ļ�����Ŀ¼�������﷨����ȷ��)
 
				filename = filename.substring(filename.lastIndexOf("\\") + 1);
//				System.out.print(filename);
				if (filename.substring(filename.lastIndexOf(".") + 1).equals("png")
						|| filename.substring(filename.lastIndexOf(".") + 1).equals("jpg")
						|| filename.substring(filename.lastIndexOf(".") + 1).equals("jpeg")) {
					InputStream in = item.getInputStream();// �@���ς���ݔ����
					FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);// ָ��web-infĿ��µ�images�ļ�
					req.setAttribute("path",  "images"+"\\" + filename);
 
					int len = 0;
					byte buffer[] = new byte[1024];
					while ((len = in.read(buffer)) > 0)// ÿ���xȡ
					{
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
					item.delete();
				} else {  //������ͼƬ�����ϴ�����ʧ��
					return ;
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		req.setAttribute("message", "�ϴ��ɹ�");
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}



}

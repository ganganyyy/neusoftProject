package com.neusoft.web.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.Ac02ServicesImpl;
import com.neusoft.system.tools.Tools;

import basic.FileUtil;

@WebServlet("/modifyPro")
public class ModifyProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
        {
			Map<String,Object> dto=FileUtil.upload(request);
            List<String> imageList = (List<String>) dto.get("imageList");          
            //ͼƬ
            String aac204=imageList.get(0);
            dto.put("aac204", aac204);
            System.out.println("1");
            Ac02ServicesImpl service=new Ac02ServicesImpl();
            System.out.println("2");
            boolean tag=service.modifyPro(dto);
            System.out.println("7");
            if(tag)
            {
            	request.setAttribute("msg","��Ʒ�޸ĳɹ�");
            }
            else
            {
            	request.setAttribute("msg","��Ʒ�޸�ʧ��");
            }
        }
        catch (Exception e)
        {
            //�õ����ǵ�Exception�쳣��Ϣ
            String Msg=e.getMessage();
            request.setAttribute("errorMsg",Msg);
        }
        request.getRequestDispatcher("/modifyPro.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        this.doGet(request, response);
	}

}

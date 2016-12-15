package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gly.dao.MessageInfoDao;
import com.gly.dao.Impl.MessageInfoDaoImpl;
import com.gly.entity.MessageInfo;
@WebServlet(urlPatterns="/sendMessageInfo.php")
public class sendMessageInfo extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		System.out.println("*******反馈中*******");
		String content = request.getParameter("content");
		String conway=request.getParameter("contact");
		System.out.println("********反馈信息："+content);
		Calendar now = Calendar.getInstance();
		int year =now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DATE);
		String dat = year+"-"+(month+1)+"-"+day;
		System.out.println("反馈日期："+dat);
		//创建实体
		MessageInfo mi = new MessageInfo();
		mi.setTitle("意见反馈");
		mi.setContent(content);
		mi.setConway(conway);
		mi.setTime(dat);
		mi.setAid(1);
		
		//开始反馈
		MessageInfoDao md = new MessageInfoDaoImpl();
		int result = md.senterMessageInfo(mi);
		if(result >=1){
			request.setAttribute("name", "反馈意见成功，感谢您的反馈信息，相信我们会做的更好！<br> <strong>↓</strong>继续浏览请点击<strong>↓</strong>");
			request.setAttribute("link", request.getContextPath()+"/help.php");
			//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
			request.getRequestDispatcher("operation.jsp").forward(request, response);
		}if(result <=0){
			request.setAttribute("name", "反馈意见失败，要不要再来一次呢！<br> <strong>↓</strong>继续浏览请点击<strong>↓</strong>");
			request.setAttribute("link", request.getContextPath()+"/help.php");
			//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
			request.getRequestDispatcher("operation.jsp").forward(request, response);
		}
		
		
		
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
	}

}

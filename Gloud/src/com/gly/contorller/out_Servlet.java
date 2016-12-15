package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gly.entity.User;
@WebServlet(urlPatterns="/out.do")
public class out_Servlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.getSession().removeAttribute("user");
			User u = (User)request.getSession().getAttribute("user");
			if(u!=null){
				System.out.println("user:"+u.getName());	
			}else{
				System.out.println("退出成功！！");
				response.sendRedirect("login.jsp");
			}
			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}

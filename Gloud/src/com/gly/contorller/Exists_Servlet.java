package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gly.dao.UserDao;
import com.gly.dao.Impl.UserDaoImpl;
import com.gly.entity.User;
@WebServlet(urlPatterns="/exists.html")
public class Exists_Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String name = request.getParameter("userName");
			UserDao ud = new UserDaoImpl();
			User user = ud.getUserByName(name);
			if(user==null){
				
			}else{
				HttpSession session =request.getSession();
				session.setAttribute("error","该用户名已被注册！");
				response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");	
				
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request,response);
	}

}

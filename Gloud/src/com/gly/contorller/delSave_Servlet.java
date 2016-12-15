package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gly.dao.GameSaveDao;
import com.gly.dao.Impl.GameSaveDaoImpl;
@WebServlet(urlPatterns="/delGameSave.php")
public class delSave_Servlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		System.out.println("******删除存档******");
		int gid =Integer.parseInt(request.getParameter("gid"));
		System.out.println("gid:"+gid);
		int result = 0;
		int id = Integer.parseInt( request.getParameter("id"));
		System.out.println("saveid:"+id);
		GameSaveDao gsd = new GameSaveDaoImpl();
		
		result = gsd.delSave(id);
		if(result>=0){
			request.setAttribute("name", "删除成功<br> <strong>↓</strong>继续浏览点击<strong>↓</strong>");
			request.setAttribute("link", request.getContextPath()+"/GameInfo.php?id="+gid);
			//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
			request.getRequestDispatcher("operation.jsp").forward(request, response);
			return;
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

doGet(request, response);
	}

}

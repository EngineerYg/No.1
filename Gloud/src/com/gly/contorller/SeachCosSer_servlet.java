package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gly.dao.CosSerDao;
import com.gly.dao.Impl.CosSerDaoImpl;
import com.gly.entity.CosSer;
@WebServlet(urlPatterns="/help.php")
public class SeachCosSer_servlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
			CosSer cs = null;
			CosSerDao cd = new CosSerDaoImpl();
			cs= cd.getCosSerInfo();
			if(cs!=null){
				request.setAttribute("cs", cs);
				request.getRequestDispatcher("help.jsp").forward(request, response);
			}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
	}

}

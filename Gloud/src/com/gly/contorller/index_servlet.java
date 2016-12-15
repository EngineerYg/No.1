package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gly.dao.GameDao;
import com.gly.dao.QqunDao;
import com.gly.dao.Impl.GameDaoImpl;
import com.gly.dao.Impl.QqunDaoImpl;
import com.gly.entity.Game;
import com.gly.entity.Qqun;
@WebServlet(urlPatterns="/index.php")
public class index_servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("sadasdas");
			GameDao gd = new GameDaoImpl();
			List<Game> list = new ArrayList<Game>();
			list = gd.getGameisIndex();
			System.out.println(list.size());
			
			if(list!=null){
				QqunDao qd = new QqunDaoImpl();
				List<Qqun> lq =qd.getAllQun();
				request.setAttribute("list", list);
				request.setAttribute("lq", lq);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
	
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
	}

}

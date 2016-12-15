package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gly.dao.GameDao;
import com.gly.dao.Impl.GameDaoImpl;
import com.gly.entity.Game;
@WebServlet(urlPatterns="/SoS.php")
public class likeSeach_Servelet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
			String name = request.getParameter("search_game");
			System.out.println("查询关键字："+name);
			GameDao gd =new GameDaoImpl();
			List<Game> list = gd.getGameByName(name);
			if(list!=null){
				request.setAttribute("list", list);
				request.getRequestDispatcher("search.jsp").forward(request, response);
			}else{
				System.out.println("*****无游戏*****");
				HttpSession session = request.getSession();
				session.setAttribute("kong", "这个游戏抓小鸡去了哟，换它邻居问问吧。。。");
				request.getRequestDispatcher("search.jsp").forward(request, response);
			}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
	}

}
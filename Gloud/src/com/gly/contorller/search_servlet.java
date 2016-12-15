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
import javax.servlet.http.HttpSession;

import com.gly.dao.GameDao;
import com.gly.dao.GameTypeDao;
import com.gly.dao.Impl.GameDaoImpl;
import com.gly.dao.Impl.GameTypeDaoImpl;
import com.gly.entity.Game;
import com.gly.entity.Gametype;
@WebServlet(urlPatterns="/search.php")
public class search_servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		List<Game> list=new ArrayList<Game>();
			String name = request.getParameter("name");
			System.out.println("name"+name);
			GameDao gd = new GameDaoImpl();
			Gametype gt=null;
			GameTypeDao td = new GameTypeDaoImpl();
			if(!name.equals("全部游戏")){			
			 gt = td.getTypeByName(name);
			 System.out.println("*********查询************");
			 System.out.print("编号："+gt.getId());
			 System.out.println("类型："+gt.getName());
			 list = gd.getGamebytype(gt.getId());
			}else{
				list= gd.getAllGame();
			}
			System.out.println("list大小："+list.size());
			if(list.size()>0){
				request.setAttribute("list", list);
				request.setAttribute("type", name);
				request.getRequestDispatcher("search.jsp").forward(request, response);	
			}else if(list.size()<=0){
				System.out.println("*****无游戏*****");
				HttpSession session = request.getSession();
				session.setAttribute("kong", "这游戏抓小鸡去了哟。。。");
				request.getRequestDispatcher("search.jsp").forward(request, response);
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
	}

}

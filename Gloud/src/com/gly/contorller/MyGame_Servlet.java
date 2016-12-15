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

import com.gly.dao.MyGameDao;
import com.gly.dao.Impl.MyGameDaoImpl;
import com.gly.entity.Game;
import com.gly.entity.User;
import com.gly.util.AithorityFilter;
@WebServlet(urlPatterns="/myGame.php")
public class MyGame_Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			HttpSession session =request.getSession();
			User user =(User)session.getAttribute("user");
			if(user!=null){
				MyGameDao md = new MyGameDaoImpl();
				List<Game> list=md.getAllMyGame(user.getID());
				if(list.size()>=1){
					System.out.println("查询到了****");
					request.setAttribute("list", list);
					request.setAttribute("type", "我的游戏");
					request.getRequestDispatcher("User_Operation/MyGame.jsp").forward(request, response);
				}else{
					System.out.println("*****无游戏*****");
					request.setAttribute("type", "我的游戏");
					System.out.println(request.getAttribute("type"));
					session.setAttribute("kong", "您还不拥有属于您自己的游戏哦。。。");
					request.getRequestDispatcher("User_Operation/MyGame.jsp").forward(request, response);
				}
			}else{
				AithorityFilter af = new AithorityFilter();
				af.doFilter(request, response, null);
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
	}

}

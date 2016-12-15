package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gly.dao.GameSaveDao;
import com.gly.dao.SaveShopDao;
import com.gly.dao.UserDao;
import com.gly.dao.Impl.GameSaveDaoImpl;
import com.gly.dao.Impl.SaveShopDaoImpl;
import com.gly.dao.Impl.UserDaoImpl;
import com.gly.entity.GameSave;
import com.gly.entity.SaveShop;
import com.gly.entity.User;
@WebServlet(urlPatterns="/buySave.php")
public class buySave_Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		System.out.println("*******够买存档中*******");
		int sid = Integer.parseInt(request.getParameter("sid"));
		 SaveShopDao sd = new SaveShopDaoImpl();
		 SaveShop sh = null;
		 sh=sd.getSaveSopById(sid);
		 HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(user.getGB()>=sh.getPrice()){
				UserDao ud = new UserDaoImpl();
				user.setGB(user.getGB()-sh.getPrice());
				int p =ud.UpdateUserGB(user); 
				if(p>=1){
					GameSave gs = new GameSave();
					gs.setUid(user.getID());
					gs.setGid(sh.getGid());
					gs.setSize(sh.getSize());
					gs.setTime("0");
					Calendar now = Calendar.getInstance();
					int year =now.get(Calendar.YEAR);
					int month = now.get(Calendar.MONTH);
					int day = now.get(Calendar.DATE);
					String sTime = year+"-"+(month+1)+"-"+day;
					gs.setStime(sTime);
					GameSaveDao gsd = new GameSaveDaoImpl();
					int g = gsd.addSave(gs);
					if(g>=1){
						request.setAttribute("name", "恭喜恭喜，购买成功！<br> <strong>↓</strong>继续浏览点击<strong>↓</strong>");
						request.setAttribute("link", request.getContextPath()+"/GameInfo.php?id="+sh.getGid());
						//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
						request.getRequestDispatcher("operation.jsp").forward(request, response);
						return;
					}
				}
			}else{
				 request.setAttribute("name", "购买失败,原因：支付失败,当前GB余额不足<br> <strong>↓</strong>返回首页点击<strong>↓</strong>");
					request.setAttribute("link", request.getContextPath()+"/index.php");
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

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

import com.gly.dao.GameDao;
import com.gly.dao.MyGameDao;
import com.gly.dao.UserDao;
import com.gly.dao.Impl.GameDaoImpl;
import com.gly.dao.Impl.MyGameDaoImpl;
import com.gly.dao.Impl.UserDaoImpl;
import com.gly.entity.MyGame;
import com.gly.entity.User;
@WebServlet(urlPatterns="/buyGame.php")
public class buyGame_servlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		System.out.println("*******够买游戏中*******");
		String time = request.getParameter("time");
		System.out.println("时长："+time);
		String pri = request.getParameter("price");
		
		String id = request.getParameter("id");
		GameDao gd = new GameDaoImpl();
		
		String type =gd.getGametypeByid(Integer.parseInt(id));
		System.out.println(type);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		double price = 0;
		
		Calendar now = Calendar.getInstance();
		int year =now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DATE);
		
		String sTime ="";
		System.out.println("购买日期："+sTime);
		String eTime = "";
		System.out.println("到期日期："+eTime);
		
		
		UserDao ud = new UserDaoImpl();
		int result  = 0;
		if(type.equals("GB")){
			if(time.equals("包月（31天）")){
				price=Double.parseDouble(pri)*3.5;
				
				 sTime = year+"-"+(month+1)+"-"+day;
				System.out.println("购买日期："+sTime);
				 eTime =  year+"-"+(month+2)+"-"+day;
				System.out.println("到期日期："+eTime);
				
			}else if(time.equals("包周（7天）") ){
				price=Double.parseDouble(pri)*1.5;
				 sTime = year+"-"+(month+1)+"-"+day;
					System.out.println("购买日期："+sTime);
					 eTime =  year+"-"+(month+1)+"-"+(day+7);
					System.out.println("到期日期："+eTime);
			}else if(time.equals("包天（24小时）")){
				price=Double.parseDouble(pri);
				 sTime = year+"-"+(month+1)+"-"+day;
					System.out.println("购买日期："+sTime);
					 eTime =  year+"-"+(month+1)+"-"+(day+1);
					System.out.println("到期日期："+eTime);
			}
			System.out.println("price:"+price);
			//double money = user.getGB();
			System.out.println("money:"+user.getGB());
			if(price<=user.getGB()){
				user.setGB(user.getGB()-price);
				result=ud.UpdateUserGB(user);
			}else{
				 request.setAttribute("name", "购买失败,原因：您的资金不足，请自己想法！<br> <strong>↓</strong>返回首页点击<strong>↓</strong>");
					request.setAttribute("link", request.getContextPath()+"/index.php");
					//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
					request.getRequestDispatcher("operation.jsp").forward(request, response);
					return;
			}
		}else if(type.equals("YB")){
			if(time.equals("包月（31天）")){
				price=Double.parseDouble(pri)*4;
				sTime = year+"-"+(month+1)+"-"+day;
				System.out.println("购买日期："+sTime);
				 eTime =  year+"-"+(month+2)+"-"+day;
				System.out.println("到期日期："+eTime);
			}else if(time.equals("包天（24小时）")){
				price=Double.parseDouble(pri);
				 sTime = year+"-"+(month+1)+"-"+day;
					System.out.println("购买日期："+sTime);
					 eTime =  year+"-"+(month+1)+"-"+(day+1);
					System.out.println("到期日期："+eTime);
			}
			//double money = user.getYB();
			
			if(price <=user.getGB()){
				user.setYB(user.getGB()-price);
				result = ud.UpdateUserYB(user);
			}else{
				 request.setAttribute("name", "购买失败,原因：您的资金不足，请自己想法！<br> <strong>↓</strong>返回首页点击<strong>↓</strong>");
					request.setAttribute("link", request.getContextPath()+"/index.php");
					//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
					request.getRequestDispatcher("operation.jsp").forward(request, response);
					return;
			}
		}else{
			 request.setAttribute("name", "购买失败,原因：支付失败<br> <strong>↓</strong>返回首页点击<strong>↓</strong>");
				request.setAttribute("link", request.getContextPath()+"/index.php");
				//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
				request.getRequestDispatcher("operation.jsp").forward(request, response);
				return;
		}
		if(result>=1){
			MyGame mg = new MyGame();
			mg.setGid(Integer.parseInt(id));
			mg.setUid(user.getID());
			//获取时间日期
			
			mg.setStime(sTime);
			mg.setEtime(eTime);
			MyGameDao md = new MyGameDaoImpl();
			int buy = md.buyGame(mg);
			if(buy>=1){
				request.setAttribute("name", "恭喜恭喜，购买成功！<br> <strong>↓</strong>继续浏览点击<strong>↓</strong>");
				request.setAttribute("link", request.getContextPath()+"/GameInfo.php?id="+id);
				//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
				request.getRequestDispatcher("operation.jsp").forward(request, response);
				return;
			}
		}
		
		
		
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
	
	}

}

package com.gly.contorller;

import java.io.IOException;
//import java.io.PrintWriter;




import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gly.dao.UserDao;
import com.gly.dao.Impl.UserDaoImpl;
import com.gly.entity.User;
@WebServlet(urlPatterns="/loginInto.html")
public class login_Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String name = request.getParameter("username");
			String pwd = request.getParameter("password");
			System.out.println("name："+name);
			System.out.println("pwd:"+pwd);
			UserDao ud = new UserDaoImpl();
			User user = ud.login(name, pwd);
			
			HttpSession session =request.getSession();
			if(user!=null){
				session.setAttribute("user", user);
				//request.setAttribute("user", user);
				Cookie cookie = new Cookie("login_user",name+":"+pwd);
				cookie.setMaxAge(7*24*60*60);
				response.addCookie(cookie);
				//request.getRequestDispatcher("/index.jsp").forward(request, response);
				Object url=session.getAttribute("url");
				session.removeAttribute("url");
				if( url!=null){
					String u = url.toString();
					u=u.substring(7);
					System.out.println("login_url:"+url+"\n"+u);
					session.removeAttribute("url");
					response.sendRedirect(u);
				}else{
					response.sendRedirect("index.php");
				}
				
			}else{
				
				session.setAttribute("error","密码错误或用户名错误");
			System.out.println(session.getAttribute("error"));
				//request.getRequestDispatcher(request.getContextPath()+"/User_Operation/login.jsp").forward(request, response);
				response.sendRedirect(request.getContextPath()+"/login.jsp");	
			}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doGet(request,response);
	}

}

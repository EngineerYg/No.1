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
import com.gly.util.Aidutil;
import com.gly.util.PwdUtil;
@WebServlet(urlPatterns="/reg.html")
public class Register_Servlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 String username = request.getParameter("username");
		 UserDao ud = new UserDaoImpl();
		 User yh = ud.getUserByName(username);
		 HttpSession session =request.getSession();
		 if(yh!=null){
			 request.setAttribute("name", "注册失败,原因：该邮箱或手机号码已被注册！<br> <strong>↓</strong>重新注册请点击<strong>↓</strong>");
				request.setAttribute("link", request.getContextPath()+"/login.jsp");
				//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
				request.getRequestDispatcher("operation.jsp").forward(request, response);
				return;
		 }
		Aidutil ad = new Aidutil();
		PwdUtil pu = new PwdUtil();
		User user = new User();
		user.setaId(ad.setAid());

		 
		 String pwd = request.getParameter("password");
		 if(username.indexOf("@")!=-1){
			 user.setEmail(username);
			 user.setPhone("");
		 }else{
			 user.setEmail("");
			 user.setPhone(username);
		 }
		
		 user.setPwd(pwd);
		 user.setPhoto("photo/tx3.png");
		 //user.setlId(1);
		 user.setName("");
		 user.setSaId(pu.setSaId(pwd));
		 user.setLvId(1);
		 user.setExm("10");
		 user.setvId(1);
		 user.setGB(0);
		 user.setYB(1000);
		
		 int result = ud.register(user);
		 if(result>0){
			 request.setAttribute("name", "注册成功,请牢记您的ID："+user.getaId()+"-可用于登录哦~");
				request.setAttribute("link", request.getContextPath()+"/login.jsp");
				//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
				request.getRequestDispatcher("operation.jsp").forward(request, response);
			 
			 //response.sendRedirect("User_Operation/login.jsp");
		 }
		 
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request,response);
	}

}

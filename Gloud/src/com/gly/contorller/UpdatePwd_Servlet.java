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
import com.gly.util.PwdUtil;
@WebServlet(urlPatterns="/exitPwd.do")
public class UpdatePwd_Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String name = request.getParameter("username");
			System.out.println(name);
			 UserDao ud = new UserDaoImpl();
			 User yh = ud.getUserByName(name);
			 HttpSession session =request.getSession();
			 if(yh==null){
				 request.setAttribute("name", "设置失败,原因：该邮箱或手机号码未被注册，请认真核对！<br> <strong>↓</strong>重新修改请点击<strong>↓</strong>");
					request.setAttribute("link", request.getContextPath()+"/forGetPwd.jsp");
					//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
					request.getRequestDispatcher("operation.jsp").forward(request, response);
					return;
			 }
			String pwd = request.getParameter("password");
			int result = ud.updatePwd(name, pwd);
			if(result>0){
				PwdUtil pu = new PwdUtil();
				int said = pu.setSaId(pwd);
				if(ud.updateSaId(said, name)>0){
					request.setAttribute("name", "修改成功");
					request.setAttribute("link", request.getContextPath()+"/login.jsp");
					//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
					request.getRequestDispatcher("operation.jsp").forward(request, response);;
				}
						
			}
			
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}

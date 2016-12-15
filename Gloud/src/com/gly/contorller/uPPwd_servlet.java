package com.gly.contorller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gly.dao.UserDao;
import com.gly.dao.Impl.UserDaoImpl;
import com.gly.entity.User;
import com.gly.util.PwdUtil;
@WebServlet(urlPatterns="/up.php")
public class uPPwd_servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			User user = (User)request.getSession().getAttribute("user");
			
			String opwd=request.getParameter("old_password");
			
			String olpwd = user.getPwd();
			HttpSession session =request.getSession();
			System.out.println(olpwd+":"+opwd);
			if(opwd.equals(olpwd)){
				String pwd=request.getParameter("password");
				UserDao ud = new UserDaoImpl();
				int result = ud.updatePwd(user.getaId(), pwd);
				if(result>0){
					PwdUtil pu = new PwdUtil();
					int said = pu.setSaId(pwd);
					if(ud.updateSaId(said, user.getaId())>0){
						request.setAttribute("name", "请牢记哦~做好重新登录的准备再跳转哦！");
						request.setAttribute("link", request.getContextPath()+"/login.jsp");
						//response.sendRedirect(request.getContextPath()+"/User_Operation/login.jsp");
						request.getRequestDispatcher("operation.jsp").forward(request, response);;
					}
							
				}
			}else{
				System.out.println("opwd:"+opwd);	
				session.setAttribute("error_pwd","与旧密码不匹配哦~");
				System.out.println(session.getAttribute("error_pwd"));
				response.sendRedirect(request.getContextPath()+"/User_Operation/upPwd.jsp");	
				return;
			}
			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request,response);
	}

}

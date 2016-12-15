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
import com.gly.dao.GameSaveDao;
import com.gly.dao.MyGameDao;
import com.gly.dao.SaveShopDao;
import com.gly.dao.ServerDao;
import com.gly.dao.Impl.GameDaoImpl;
import com.gly.dao.Impl.GameSaveDaoImpl;
import com.gly.dao.Impl.MyGameDaoImpl;
import com.gly.dao.Impl.SaveShopDaoImpl;
import com.gly.dao.Impl.ServerDaoImpl;
import com.gly.entity.Game;
import com.gly.entity.GameSave;
import com.gly.entity.MyGame;
import com.gly.entity.SaveShop;
import com.gly.entity.Server;
import com.gly.entity.User;
@WebServlet(urlPatterns="/GameInfo.php")
public class Select_GameByID extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			HttpSession session = request.getSession();
		
			int id=Integer.parseInt(request.getParameter("id"));
			System.out.println("游戏Id:"+id);
			
			MyGameDao md = new MyGameDaoImpl();
			GameDao gd= new GameDaoImpl();
		
			Game game = new Game();
			game=gd.getGamebyId(id);
			MyGame mg=null;
			if(game!=null){
				List<GameSave> gl = new ArrayList<GameSave>();
				int type=game.getGametype();
				List<Game> gameTlist = gd.getGamebytype(type);
				int saveCount = 0;
				if(gameTlist.size()<=1){
					gameTlist = gd.getGamebytype(1);
				}
				if(session.getAttribute("user")!=null){
					User user = (User)session.getAttribute("user");
					 mg = md.getMyGamebyid(game.getGameid(), user.getID());
					 GameSaveDao gsd= new GameSaveDaoImpl();
					 System.out.println("gl.size:"+gl.size());
					 gl = gsd.getAllSave(user.getID(), id);
					 saveCount = gsd.getSaveCount(user.getID(), id);
					 request.setAttribute("save", gl);
					 SaveShopDao sd = new SaveShopDaoImpl();
					 List<SaveShop> sl = sd.getallGameSaveShop(id);
					 request.setAttribute("sl", sl);
				}
				ServerDao sd = new ServerDaoImpl();
				List<Server> serverlist = sd.getAll();
				System.out.println("服务:"+serverlist.size());
				request.setAttribute("server", serverlist);
				request.setAttribute("mygame", mg);
				request.setAttribute("tlist", gameTlist);
				request.setAttribute("game", game);
				request.setAttribute("count", saveCount);
				request.getRequestDispatcher("GameInfo.jsp").forward(request, response);
			}
			
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doGet(request, response);
		
	}

}

package com.gly.test;

import java.sql.Date;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.gly.dao.UserDao;
import com.gly.dao.Impl.UserDaoImpl;
import com.gly.entity.Game;
import com.gly.util.Aidutil;
import com.gly.util.PwdUtil;

public class Test {
public static void main(String[] args) {
//	PwdUtil ps = new PwdUtil();
//	int said = ps.setSaId("admin...........");
//	System.out.println("said:"+said);
	
	List<Game> list = new ArrayList<Game>();
	Game g = new Game();
	Game a = new Game();
	Game m = new Game();
	Game e = new Game();
	g.setGamename("龙珠超");
	a.setGamename("拳皇");
	m.setGamename("实况");
	e.setGamename("信科此");

	list.add(g);
	list.add(a);
	list.add(m);
	list.add(e);
	
	List<List<Game>> l = new ArrayList<List<Game>>();
	l.add(list);
	
	for (int i = 0; i < l.size(); i++) {
		List<Game> ll = l.get(i);
		for (Game game : ll) {
			System.out.println("name："+game.getGamename());
		}
		
	}
	
	//时间 获取当前时间
	Calendar now = Calendar.getInstance();
	int year =now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH);
	int day = now.get(Calendar.DATE);
	String dat = year+"-"+(month+1)+"-"+day;
	System.out.println(dat);
	
	String price = "499.0G币";
	
	
}
}

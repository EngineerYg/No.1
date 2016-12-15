package com.gly.util;

import com.gly.dao.UserDao;
import com.gly.dao.Impl.UserDaoImpl;

public class Aidutil {
	public String setAid(){
		UserDao ud = new UserDaoImpl();
		String aid = ud.getMaxID();
		int id = Integer.parseInt(aid)+6;
		aid = Integer.toString(id);
		System.out.println("Aid:"+aid);
		return aid;
	}
}

package com.gly.dao;

import java.util.List;

import com.gly.entity.Server;

public interface ServerDao {
	public List<Server> getAll();
	
	public int delServer(int id);
	
	public int addServer(Server s);
}

package com.gly.dao;

import java.util.List;

import com.gly.entity.GameSave;

public interface GameSaveDao {
	public List<GameSave> getAllSave(int uid,int gid);
	
	public int delSave(int id);
	public int getSaveCount(int uid ,int gid);
	
	public int addSave(GameSave gs);
	
}

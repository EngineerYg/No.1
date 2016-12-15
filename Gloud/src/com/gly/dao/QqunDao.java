package com.gly.dao;

import java.util.List;

import com.gly.entity.Qqun;

/**
 * 玩家群 接口
 * @author YG
 *
 */
public interface QqunDao {
	public List<Qqun> getAllQun();
	
	public int delQun(int id);
	
	public int addQun(Qqun qu);
	
	
}

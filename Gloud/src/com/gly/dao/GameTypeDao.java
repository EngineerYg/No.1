package com.gly.dao;

import java.util.List;

import com.gly.entity.Gametype;

/**
 * 游戏类型制造
 * @author YG
 *
 */
public interface GameTypeDao {
	/**
	 * 获得所有游戏类型
	 * @return 返回游戏类型集合
	 */
	public List<Gametype> getAllGameType();
	/**
	 * 删除游戏类型
	 * @param id 游戏类型Id
	 * @return 返回受影响行数
	 */
	public int delGameType(int id);
	/**
	 * 添加游戏类型
	 * @param gt
	 * @return 受影响行数
	 */
	public int addGameType(Gametype gt);
	/**
	 * 根据Id查询类型
	 * @param id
	 * @return
	 */
	public Gametype getTypeById(int id);
	
	public Gametype getTypeByName(String name);
}

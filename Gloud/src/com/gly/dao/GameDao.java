package com.gly.dao;

import java.util.List;

import com.gly.entity.Game;

/**
 * 游戏接口类
 * @author YG
 *
 */
public interface GameDao {
	/**
	 * 查询所有游戏集合
	 * @return 返回游戏集合
	 */
	public List<Game> getAllGame();
	/**
	 * 根据Id插叙游戏详情
	 * @param id
	 * @return 游戏类型
	 */
	public Game getGamebyId(int id);
	/**
	 * 游戏下线
	 * @param id
	 * @return 返回受影响行数
	 */
	public int delGame(int id);
	/**
	 * 更改游戏
	 * @param game
	 * @return
	 */
	public int updGame(Game game);
	/**
	 * 添加游戏
	 * @param game 游戏
	 * @return 返回受影响行数
	 */
	public int addGame(Game game);
	/**
	 * 根据游戏类型获得游戏
	 * @param type
	 * @return
	 */
	public List<Game> getGamebytype(int typeid);
	/**
	 * 查询前九条数据
	 * @return
	 */
	public List<Game> getGameisIndex();
	/**
	 * 根据游戏类型查询
	 * @param name
	 * @return
	 */
	public List<Game> getGameByName(String id);
	/**
	 * 查询游戏的支付类型
	 * @param id
	 * @return
	 */
	public String getGametypeByid(int id);
	

}

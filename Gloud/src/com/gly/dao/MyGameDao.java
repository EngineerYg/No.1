package com.gly.dao;

import java.util.List;

import com.gly.entity.Game;
import com.gly.entity.MyGame;

/**
 * 个人游戏接口
 * @author YG
 *
 */
public interface MyGameDao {
		/**
		 * 获得我的所有游戏
		 * @return
		 */
		public List<Game> getAllMyGame(int id);
		/**
		 * 根据ID查找我的游戏
		 * @param id
		 * @return
		 */
		public MyGame getMyGamebyid(int gid,int uid);
		/**
		 * 购买游戏
		 * @param game
		 * @return
		 */
		public int buyGame(MyGame game);
		
}

package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.MyGameDao;
import com.gly.entity.Game;
import com.gly.entity.MyGame;
import com.gly.util.BaseDao;

public class MyGameDaoImpl extends BaseDao implements MyGameDao{

	@Override
	public List<Game> getAllMyGame(int id) {
		String sql ="select g.Gameid,g.Gamename,g.Gametitle,g.Gametype,g.Gamerenshu,g.Gamedetails,g.GameDP,g.Gamephoto,g.Gamephoto1,g.Gamephoto2,g.Gamephoto3,g.Gamephoto4,g.Gamephoto5,g.GameMoneytype,g.GameMoney from Game g"
+" inner join MyGame m on g.Gameid=m.Gameid"
+" inner join User_Info u on m.Userid =u.id"
+" where u.id=?";
		Game game =null;
		List<Game> list = new ArrayList<Game>();
		Object[] params ={id};
		System.out.println("我的游戏Sql:"+sql);
		ResultSet rs =super.excuteQuery(sql, params); 
		try {
			while(rs.next()){
				game = new Game();
				game.setGameid(rs.getInt("GameID"));
				game.setGamename(rs.getString("Gamename"));
				game.setTitle(rs.getString("Gametitle"));
				game.setGametype(rs.getInt("GameType"));
				game.setGameRenshu(rs.getInt("Gamerenshu"));
				game.setGameinfo(rs.getString("Gamedetails"));
				game.setGameDP(rs.getString("GameDP"));
				game.setGamephoto(rs.getString("Gamephoto"));
				game.setGamephoto1(rs.getString("Gamephoto1"));
				game.setGamephoto2(rs.getString("Gamephoto2"));
				game.setGamephoto3(rs.getString("Gamephoto3"));
				game.setGamephoto4(rs.getString("Gamephoto4"));
				game.setGamephoto5(rs.getString("Gamephoto5"));
				game.setGameMoneytype(rs.getInt("GameMoneytype"));
				game.setGameMoney(rs.getDouble("GameMoney"));
				list.add(game);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("查询我的游戏sql:"+sql);
		return list;
	}

	@Override
	public MyGame getMyGamebyid(int gid,int uid) {
		MyGame mg = null;
		String sql="select * from Mygame where Gameid=? and Userid=?";
		Object[] params ={gid,uid};
		ResultSet rs = super.excuteQuery(sql, params);
		try {
			while (rs.next()) {
				mg = new MyGame();
				mg.setId(rs.getInt("id"));
				mg.setGid(rs.getInt("GameiD"));
				mg.setUid(rs.getInt("Userid"));
				mg.setStime(rs.getString("begintime"));
				mg.setEtime(rs.getString("endtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mg;
	}

	@Override
	public int buyGame(MyGame game) {
		int result =0;
		String sql = "insert into MyGame values(?,?,?,?)";
		Object[] params ={game.getGid(),game.getUid(),game.getStime(),game.getEtime()};
		result = super.executeUpdate(sql, params);
		return result;
	}
	
}

package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.GameDao;
import com.gly.entity.Game;
import com.gly.util.BaseDao;
/**
 * 游戏接口实现类
 * @author YG
 *
 */
public class GameDaoImpl extends BaseDao implements GameDao {

	@Override
	public List<Game> getAllGame() {
		List<Game> list = new ArrayList<Game>();
		String sql = "select * from Game";
		Game game = null;
		ResultSet rs = super.excuteQuery(sql, null);
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
			e.printStackTrace();
		}finally{
			try {
				super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public Game getGamebyId(int id) {
		Game game = new Game();
		String sql = "select * from Game where Gameid =?";
		Object[] params = {id};
		ResultSet rs = super.excuteQuery(sql, params);
		try {
			while(rs.next()){
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
		return game;
	}

	@Override
	public int delGame(int id) {
		int result =0;
		String sql = "delete from Game where id =?";
		Object[] params ={id};
		result = super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int updGame(Game game) {
		int result =0;
		String sql ="upadte Game set Gamename=?,Gametype=?,Gamerenshu=?,Gamedetails=?,GameDP=?,Gamephoto=?,Gamephoto1=?,Gamephoto2=?,Gamephoto3=?,Gamephoto4=?,Gamephoto5=?,GameMoneytype=?,GameMoney=? where GameId =?";
		Object[] params = {game.getGamename(),game.getTitle(),game.getGametype(),
				game.getGameRenshu(),game.getGameinfo(),game.getGameDP(),game.getGamephoto(),game.getGamephoto1(),game.getGamephoto2(),game.getGamephoto3(),game.getGamephoto4(),game.getGamephoto5(),game.getGameMoneytype(),game.getGameMoney(),game.getGameid()};
		result = super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int addGame(Game game) {
		int result =0;
		String sql ="insert into Game values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {game.getGameid(),game.getGamename(),game.getTitle(),game.getGametype(),
				game.getGameRenshu(),game.getGameinfo(),game.getGameDP(),game.getGamephoto(),game.getGamephoto1(),game.getGamephoto2(),game.getGamephoto3(),game.getGamephoto4(),game.getGamephoto5(),game.getGameMoneytype(),game.getGameMoney()};
		result = super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public List<Game> getGamebytype(int typeid) {
		List<Game> list = new ArrayList<Game>();
		String sql = "select * from Game where Gametype=?";
		Game game = null;
		Object[] params ={typeid};
		ResultSet rs = super.excuteQuery(sql, params);
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
			e.printStackTrace();
		}finally{
			try {
				super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<Game> getGameisIndex() {
		List<Game> list = new ArrayList<Game>();
		String sql = "select top(9)*  from Game ";
		Game game = null;
		ResultSet rs = super.excuteQuery(sql, null);
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
			e.printStackTrace();
		}finally{
			try {
				super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<Game> getGameByName(String name) {
		List<Game> list = new ArrayList<Game>();
		String sql="select * from Game where Gamename like ?";
		Object[] params ={"%"+name+"%"};
		Game game = null;
		ResultSet rs = super.excuteQuery(sql, params);
		System.out.println("查询游戏Sql:"+sql);
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
			
			e.printStackTrace();
		}finally{
			try {
				super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public String getGametypeByid(int id) {
		int typeid =0;
		String sql = "select GameMoneytype c from Game where Gameid = ?";
		Object[] params={id};
		ResultSet rs = super.excuteQuery(sql, params);
		try {
			while(rs.next()){
				typeid =rs.getInt("c");
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
		String ty = "";
		if(typeid==1){
			ty="GB";
		}else{
			ty="YB";
		}
		return ty;
	}



}

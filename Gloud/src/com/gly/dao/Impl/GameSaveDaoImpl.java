package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.GameSaveDao;
import com.gly.entity.Game;
import com.gly.entity.GameSave;
import com.gly.util.BaseDao;

public class GameSaveDaoImpl extends BaseDao implements GameSaveDao {

	@Override
	public List<GameSave> getAllSave(int uid ,int gid) {
		List<GameSave> list = new ArrayList<GameSave>();
		GameSave gs = null;
		String sql ="select * from MyGameSave where uid =? and gid =?";
		Object[] params ={uid , gid};
		ResultSet rs = super.excuteQuery(sql, params);
		try {
			while(rs.next()){
				gs = new GameSave();
				gs.setId(rs.getInt("id"));
				gs.setUid(rs.getInt("uid"));
				gs.setGid(rs.getInt("gid"));
				gs.setTime(rs.getString("time"));
				gs.setSize(rs.getString("size"));
				gs.setStime(rs.getString("times"));
				list.add(gs);
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
	public int delSave(int id) {
		int result =0;
		String sql ="delete from MyGameSave where id =?";
		Object[] params ={id};
		result= super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int getSaveCount(int uid ,int gid) {
		int result =0;
		String sql ="select Count(*) c from MyGameSave where uid =? and gid =?";
		Object[] params ={uid , gid};
		ResultSet rs = super.excuteQuery(sql, params);
		try {
			while(rs.next()){
				result = rs.getInt("c");
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
		return result;
	}

	@Override
	public int addSave(GameSave gs) {
		String sql ="insert into MyGameSave values(?,?,?,?,?)";
		Object[] params = {gs.getUid(),gs.getGid(),gs.getTime(),gs.getSize(),gs.getStime()};
		int result = super.executeUpdate(sql, params);
		return result;
	}

}

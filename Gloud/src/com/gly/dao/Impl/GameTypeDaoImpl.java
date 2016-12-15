package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.GameTypeDao;
import com.gly.entity.Gametype;
import com.gly.util.BaseDao;
/**
 * 游戏类型实现类
 * @author YG
 *
 */
public class GameTypeDaoImpl extends BaseDao implements GameTypeDao {

	@Override
	public List<Gametype> getAllGameType() {
		List<Gametype> list = new ArrayList<Gametype>();
		String sql ="select * from Gametype";
		Gametype gt = null;
		ResultSet rs = super.excuteQuery(sql, null);
		try {
			while(rs.next()){
				gt = new Gametype();
				gt.setId(rs.getInt("typeid"));
				gt.setName(rs.getString("typeName"));
				list.add(gt);
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
	public int delGameType(int id) {
		int result=0;
		String sql = "delete from GameType where typeId=?";
		Object[] params = {id};
		result=super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int addGameType(Gametype gt) {
		int result =0;
		String sql ="insert into GameType values(?)";
		Object[] params = {gt.getName()};
		result = super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public Gametype getTypeById(int id) {
		String sql ="select * from GameType where typeid=?";
		Object[] params ={id}; 
		Gametype gt = new Gametype();
		ResultSet rs = super.excuteQuery(sql, params);
		try {
			while(rs.next()){
				gt = new Gametype();
				gt.setId(rs.getInt("typeid"));
				gt.setName(rs.getString("typeName"));
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
		return gt;
	}

	@Override
	public Gametype getTypeByName(String name) {
		String sql ="select * from GameType where typename=?";
		Object[] params ={name}; 
		Gametype gt = new Gametype();
		ResultSet rs = super.excuteQuery(sql, params);
		try {
			while(rs.next()){
				gt = new Gametype();
				gt.setId(rs.getInt("typeid"));
				gt.setName(rs.getString("typeName"));
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
		return gt;
	}

}

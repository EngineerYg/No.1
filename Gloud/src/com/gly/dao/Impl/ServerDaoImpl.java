package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.ServerDao;
import com.gly.entity.SaveShop;
import com.gly.entity.Server;
import com.gly.util.BaseDao;

public class ServerDaoImpl extends BaseDao implements ServerDao {

	@Override
	public List<Server> getAll() {
		List<Server> list = new ArrayList<Server>();
		String sql ="select * from Server";
		ResultSet rs = super.excuteQuery(sql, null);
		Server s= null;
		try {
			while(rs.next()){
				s = new Server();
				s.setId(rs.getInt("id"));
				s.setPer(rs.getInt("Per"));
				s.setName(rs.getString("name"));
				s.setSpeed(rs.getString("Speed"));
				s.setDelayed(rs.getString("delayed"));
				list.add(s);
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
	public int delServer(int id) {
		int result =0;
		String sql ="delete from server where id =?";
		Object[] params ={id};
		result= super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int addServer(Server s) {
		String sql ="insert into Server values(?,?,?,?)";
		Object[] params = {s.getName(),s.getSpeed(),s.getPer(),s.getDelayed()};
		int result = super.executeUpdate(sql, params);
		return result;
	}

}

package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.QqunDao;
import com.gly.entity.MyGame;
import com.gly.entity.Qqun;
import com.gly.util.BaseDao;

public class QqunDaoImpl extends BaseDao implements QqunDao {

	@Override
	public List<Qqun> getAllQun() {
		List<Qqun> list = new ArrayList<Qqun>();
		String sql ="select * from QQun";
		Qqun qu = null;
		ResultSet rs = super.excuteQuery(sql, null);
		try {
			while (rs.next()) {
				qu = new Qqun();
				qu.setId(rs.getInt("id"));
				qu.setQq(rs.getString("QNO"));
				list.add(qu);
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
	public int delQun(int id) {
		int result =0;
		String sql ="delete from QQun where id=?";
		Object[] params = {id};
		result = super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int addQun(Qqun qu) {
		int result =0;
		String sql ="insert into QQun values (?)";
		Object[] params = {qu.getQq()};
		result = super.executeUpdate(sql, params);
		return result;
	}

}

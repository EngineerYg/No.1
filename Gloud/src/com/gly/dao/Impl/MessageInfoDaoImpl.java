package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.MessageInfoDao;
import com.gly.entity.MessageInfo;
import com.gly.util.BaseDao;

public class MessageInfoDaoImpl extends BaseDao implements MessageInfoDao {

	@Override
	public List<MessageInfo> getALLMessageInfo() {
		List<MessageInfo> list = new ArrayList<MessageInfo>();
		String sql ="select * from message_Info";
		ResultSet rs = super.excuteQuery(sql, null);
		MessageInfo mi = null;
		try {
			while(rs.next()){
				mi = new MessageInfo();
				mi.setId(rs.getInt("mid"));
				mi.setTitle(rs.getString("title"));
				mi.setContent(rs.getString("content"));
				mi.setConway(rs.getString("contactWay"));
				mi.setTime(rs.getString("Stime"));
				mi.setAid(rs.getInt("aid"));
				list.add(mi);
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
	public int senterMessageInfo(MessageInfo mi) {
		int result = 0;
		String sql ="insert into message_Info values(?,?,?,?,?)";
		Object[] params ={mi.getTitle(),mi.getContent(),mi.getConway(),mi.getTime(),mi.getAid()};
		result = super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int delMessageInfo(int id) {
		int result = 0;
		String sql ="delete from message_Info where id=?";
		Object[] params ={id};
		result = super.executeUpdate(sql, params);
		return result;
	}

}

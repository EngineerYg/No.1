package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.gly.dao.CosSerDao;
import com.gly.entity.CosSer;
import com.gly.util.BaseDao;

public class CosSerDaoImpl extends BaseDao implements CosSerDao {

	@Override
	public CosSer getCosSerInfo() {
		CosSer cs = null;
			String sql ="select * from CosSer where id=1";
			ResultSet rs = super.excuteQuery(sql, null);
			try {
				while(rs.next()){
					cs = new CosSer();
					cs.setId(rs.getInt("id"));
					cs.setTitle(rs.getString("title"));
					cs.setQQ(rs.getString("QQ"));
					cs.setEmail(rs.getString("email"));
					cs.setTime(rs.getString("time"));
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
		return cs;
	}

	@Override
	public int upCosSerInfo(CosSer cs) {
		int result=0;
		String sql = "update CosSer set title=?,QQ=?,email=?,time=? where id=1";
		Object[] params={cs.getTitle(),cs.getQQ(),cs.getEmail(),cs.getTime()};
		result=super.executeUpdate(sql, params);
		return result;
	}

}

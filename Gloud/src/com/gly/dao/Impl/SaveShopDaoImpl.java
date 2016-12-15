package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gly.dao.SaveShopDao;
import com.gly.entity.CosSer;
import com.gly.entity.SaveShop;
import com.gly.util.BaseDao;

public class SaveShopDaoImpl extends BaseDao implements SaveShopDao {

	@Override
	public List<SaveShop> getallGameSaveShop(int gid) {
		String sql ="select * from SaveShop where gid=?";
		Object[] params={gid};
		List<SaveShop> list = new ArrayList<SaveShop>();
		ResultSet rs= super.excuteQuery(sql, params);
		SaveShop sh = null ;
		try {
			while(rs.next()){
				sh = new SaveShop();
				sh.setId(rs.getInt("id"));
				sh.setGid(rs.getInt("gid"));
				sh.setInfo(rs.getString("saveinfo"));
				sh.setName(rs.getString("savename"));
				sh.setPrice(rs.getDouble("price"));
				sh.setSize(rs.getString("size"));
				list.add(sh);
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
	public SaveShop getSaveSopById(int id) {
		String sql ="select * from SaveShop where id=?";
		Object[] params={id};
		ResultSet rs= super.excuteQuery(sql, params);
		SaveShop sh = null ;
		try {
			while(rs.next()){
				sh = new SaveShop();
				sh.setId(rs.getInt("id"));
				sh.setGid(rs.getInt("gid"));
				sh.setInfo(rs.getString("saveinfo"));
				sh.setName(rs.getString("savename"));
				sh.setPrice(rs.getDouble("price"));
				sh.setSize(rs.getString("size"));
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
		return sh;
	}

}

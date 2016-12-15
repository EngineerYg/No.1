package com.gly.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.gly.dao.UserDao;
import com.gly.entity.User;
import com.gly.util.BaseDao;

public class UserDaoImpl extends BaseDao implements UserDao{

	@Override
	public User login(String name, String pwd) {
		String sql ="select * from User_Info where  (aId =? or email=? or phone=?) and pwd =?";
		Object[] params = {name,name,name,pwd};
		ResultSet rs = super.excuteQuery(sql, params);
		System.out.println("sql:"+sql);
		User user = null;
		if(rs!=null){
			try {
				while(rs.next()){
					user= new User();
					user.setID(rs.getInt("id"));
					user.setaId(rs.getString("aid"));
					user.setPwd(rs.getString("pwd"));
					user.setPhoto(rs.getString("photo"));
					//user.setlId(rs.getInt("lid"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setPhone(rs.getString("phone"));
					user.setSaId(rs.getInt("saId"));
					user.setLvId(rs.getInt("lvId"));
					user.setExm(rs.getString("exm"));
					user.setvId(rs.getInt("vId"));
					user.setGB(rs.getDouble("GB"));
					user.setYB(rs.getDouble("YB"));
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally{
				if(rs!=null){
					try {
						super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return user;
	}

	@Override
	public int register(User user) {
		String sql ="insert into user_Info values(?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {user.getaId(),user.getPwd(),user.getPhoto(),user.getName(),user.getEmail(),user.getPhone(),user.getSaId(),user.getLvId(),user.getExm(),user.getvId(),user.getGB(),user.getYB()};
		int result = super.executeUpdate(sql, params);	
		return result;
	}

	@Override
	public String getMaxID() {
		String sql = "select max(aId)g  from User_Info";
		ResultSet rs = super.excuteQuery(sql, null);
		String aid="300006";
		try {
			while(rs.next()){
				aid = rs.getString("g");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("g:"+aid);
		return aid;
	}

	@Override
	public User getUserByName(String name) {
		User user = null;
		String sql = "select * from User_Info where  (email=? or phone=?) ";
		Object[] params = {name,name};
		ResultSet rs = super.excuteQuery(sql, params);
	if(rs!=null){
		try {
			while(rs.next()){
				user= new User();
				user.setID(rs.getInt("id"));
				user.setaId(rs.getString("aid"));
				user.setPwd(rs.getString("pwd"));
				user.setPhoto(rs.getString("photo"));
				//user.setlId(rs.getInt("lid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setSaId(rs.getInt("saId"));
				user.setLvId(rs.getInt("lvId"));
				user.setExm(rs.getString("exm"));
				user.setvId(rs.getInt("vId"));
				user.setGB(rs.getDouble("GB"));
				user.setYB(rs.getDouble("YB"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			try {
				super.closeAll(rs.getStatement().getConnection(), rs.getStatement(), rs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
		return user;
	}

	@Override
	public int updatePwd(String name, String pwd) {
		int result =0;
		String sql ="update user_info set pwd=? where (aId =? or email=? or phone=?)";
		Object[] params = {pwd,name ,name,name};
		result = super.executeUpdate(sql, params);
		System.out.println("sql:"+sql);
		return result;
	}

	@Override
	public int updateSaId(int said,String name) {
		int result=0;
		String sql = "update user_info set saId=? where (aId =? or email=? or phone=?)";
		Object[] params = {said,name,name,name};
		result = super.executeUpdate(sql, params);
		return result;
	}

	@Override
	public int UpdateUserGB(User user) {
		int result = 0;
		String sql = "update User_Info set GB=? where id =?";
		Object[] params={user.getGB(),user.getID()};
		result = super.executeUpdate(sql, params);
		return result;
	}
	public int UpdateUserYB(User user) {
		int result = 0;
		String sql = "update User_Info set YB=? where id =?";
		Object[] params={user.getYB(),user.getID()};
		result = super.executeUpdate(sql, params);
		return result;
	}

}

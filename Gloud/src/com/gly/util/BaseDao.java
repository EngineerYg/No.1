package com.gly.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDao {

	private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Gloud";
	private static String userName = "sa";
	private static String pwd = "123456";
	
	/**
	 * 执行增删改
	 * @param sql
	 * @param params
	 * @return
	 */
	public int executeUpdate(String sql,Object[] params){
		
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement psmt = null;
		try {
			psmt = conn.prepareStatement(sql);
			if(params != null) {//设置参数
				for(int i = 0; i<params.length; i++) {
					psmt.setObject(i+1, params[i]);
				}
			}
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		closeAll(conn, psmt, null);
		return result;
	}
	
	/**
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public ResultSet excuteQuery(String sql,Object[] params){
		Connection conn =  null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			if(params != null){
				for(int i = 0; i <params.length; i++){
					psmt.setObject(i+1, params[i]);
				}
			}
		
			rs = psmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	//获取数据库连接的方法 
	public Connection getConnection(){
		Connection conn = null;
		//1加载驱动类
		try {
			Class.forName(driver);
		//2通过DriverManager建立数据库连接
			conn = DriverManager.getConnection(url, userName, pwd);
		if(conn != null) {
			System.out.println("数据库连接成功");
		} else {
			System.out.println("数据库连接失败");
		}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e){
			System.out.println("发生数据库异常"+e.getMessage());
			//e.printStackTrace();
		}
		
		return conn;
	
	}
	
	//释放数据库资源
	public void closeAll(Connection conn,Statement st,ResultSet rs){
		try{
			//关闭的顺序
			if(rs != null) {
				rs.close();
			}
			
			if(st != null) {
				st.close();
			}
			
			if(conn != null) {
				conn.close();//关闭连接
				System.out.println("数据库关闭成功");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}

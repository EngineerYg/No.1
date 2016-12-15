package com.gly.dao;

import com.gly.entity.User;
/**
 * 用户操作接口
 * @author YG
 *
 */
public interface UserDao {
	/**
	 * 登录 接口
	 * @param name 登录名
	 * @param pwd	登录密码
	 * @return	返回对象
	 */
	public User login(String name, String pwd);
	/**
	 * 注册 接口
	 * @param user
	 * @return
	 */
	public int register(User user);
	
	/**
	 * 获得最大的ID 
	 */
	public String getMaxID();
	/**
	 * 根据用户输入获得对象
	 * @return
	 */
	public User getUserByName(String name);
	/**
	 * 修改密码
	 * @param name
	 * @param pwd
	 * @return
	 */
	public int updatePwd(String name,String pwd);
	/**
	 * 设置安全等级
	 * @param said
	 * @param name
	 * @return
	 */
	public int updateSaId(int said,String name);
	
	/**
	 * 修改个人信息
	 * 购买游戏 扣除资金
	 */
	public int UpdateUserGB(User user);
	public int UpdateUserYB(User user);
}

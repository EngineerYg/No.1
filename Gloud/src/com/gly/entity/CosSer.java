package com.gly.entity;
/**
 * 客服实体类
 * @author YG
 *
 */
public class CosSer {
	/**
	 * 编号
	 */
	private int id ;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * QQ
	 */
	private String QQ;
	/**
	 *邮箱
	 */
	private String email;
	/**
	 * 时间
	 */
	private String time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}

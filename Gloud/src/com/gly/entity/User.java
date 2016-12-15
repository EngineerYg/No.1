package com.gly.entity;
/**
 * 用户实体类
 * @author YG
 *
 */
public class User {
	/**
	 * ID编号
	 */
	private int ID;
	/**
	 * 用于登录的ID
	 */
	private String aId;

	/**
	 * 密码
	 */
	private String pwd;
	/**
	 * 头像
	 */
	private String photo;
	/**
	 * 登录身份
	 */
	//private int lId;
	/**
	 * 昵称
	 */
	private String name;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 电话
	 */
	private String phone;
	/**
	 * 安全等级
	 */
	
	private int saId;
	/**
	 * 等级
	 */
	private int lvId;
	/**
	 * 经验值
	 */
	private String exm;
	/**
	 * 会员身份
	 */
	private int vId;
	/**
	 * G币
	 */
	private double GB;

	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public void setID(int iD) {
		ID = iD;
	}
	
	public int getID() {
		return ID;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	//public int getlId() {
	//	return lId;
	//}
	//public void setlId(int lId) {
	//	this.lId = lId;
	//}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getSaId() {
		return saId;
	}
	public void setSaId(int saId) {
		this.saId = saId;
	}
	public int getLvId() {
		return lvId;
	}
	public void setLvId(int lvId) {
		this.lvId = lvId;
	}
	public String getExm() {
		return exm;
	}
	public void setExm(String exm) {
		this.exm = exm;
	}
	public int getvId() {
		return vId;
	}
	public void setvId(int vId) {
		this.vId = vId;
	}
	public double getGB() {
		return GB;
	}
	public void setGB(double gB) {
		GB = gB;
	}
	public double getYB() {
		return YB;
	}
	public void setYB(double yB) {
		YB = yB;
	}
	/**
	 * Y币
	 */
	private double YB;
	
	
}

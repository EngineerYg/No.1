package com.gly.entity;

public class MyGame {
	/**
	 * 编号
	 */
	private int id;
	/**
	 * 游戏id
	 */
	private int gid;
	/**
	 * 用户ID
	 */
	private int uid;
	/**
	 * 购买时间
	 */
	private String stime;
	/**
	 * 结束时间
	 */
	private String etime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}
}

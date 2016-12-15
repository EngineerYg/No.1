package com.gly.entity;
/**
 * 游戏类型实体类
 * @author YG
 *
 */
public class Gametype {
	/**
	 * 编号
	 */
	private int id;
	/**
	 * 类型名称
	 */
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}

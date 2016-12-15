package com.gly.entity;
/**
 * 反馈信息实体
 * @author YG
 *
 */
public class MessageInfo {
	private int id ;
	
	private String title;
	
	private String content;
	
	private String conway;
	
	private String time;
	
	private int aid;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getConway() {
		return conway;
	}

	public void setConway(String conway) {
		this.conway = conway;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}
	
	
}

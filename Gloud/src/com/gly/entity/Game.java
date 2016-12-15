package com.gly.entity;
/**
 * 游戏实体类
 * @author YG
 *
 */
public class Game {
	/**
	 * 游戏编号
	 */
	private int gameid;
	/**
	 * 游戏名称
	 */
	private String gamename;
	/**
	 * 游戏标题
	 */
	private String title;
	/**
	 * 游戏类型
	 */
	private int gametype;
	/**
	 * 游戏人数
	 */
	private int gameRenshu;		
	/**
	 * 游戏详情
	 */
	private String gameinfo;
	/**
	 * 游戏代表图
	 */
	private String gameDP;
	/**
	 * 游戏banner图
	 */
	private String gamephoto;	
	/**
	 * 游戏介绍图
	 */
	private String gamephoto1;	
	private String gamephoto2;	
	private String gamephoto3;	
	private String gamephoto4;	
	private String gamephoto5;	
	/**
	 * 支付方式
	 */
	private int gameMoneytype;
	/**
	 * 游戏单价  24小时价钱
	 */
	private	double gameMoney;
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getGamename() {
		return gamename;
	}
	public void setGamename(String gamename) {
		this.gamename = gamename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getGametype() {
		return gametype;
	}
	public void setGametype(int gametype) {
		this.gametype = gametype;
	}
	public int getGameRenshu() {
		return gameRenshu;
	}
	public void setGameRenshu(int gameRenshu) {
		this.gameRenshu = gameRenshu;
	}
	public String getGameinfo() {
		return gameinfo;
	}
	public void setGameinfo(String gameinfo) {
		this.gameinfo = gameinfo;
	}
	public String getGameDP() {
		return gameDP;
	}
	public void setGameDP(String gameDP) {
		this.gameDP = gameDP;
	}
	public String getGamephoto() {
		return gamephoto;
	}
	public void setGamephoto(String gamephoto) {
		this.gamephoto = gamephoto;
	}
	public String getGamephoto1() {
		return gamephoto1;
	}
	public void setGamephoto1(String gamephoto1) {
		this.gamephoto1 = gamephoto1;
	}
	public String getGamephoto2() {
		return gamephoto2;
	}
	public void setGamephoto2(String gamephoto2) {
		this.gamephoto2 = gamephoto2;
	}
	public String getGamephoto3() {
		return gamephoto3;
	}
	public void setGamephoto3(String gamephoto3) {
		this.gamephoto3 = gamephoto3;
	}
	public String getGamephoto4() {
		return gamephoto4;
	}
	public void setGamephoto4(String gamephoto4) {
		this.gamephoto4 = gamephoto4;
	}
	public String getGamephoto5() {
		return gamephoto5;
	}
	public void setGamephoto5(String gamephoto5) {
		this.gamephoto5 = gamephoto5;
	}
	public int getGameMoneytype() {
		return gameMoneytype;
	}
	public void setGameMoneytype(int gameMoneytype) {
		this.gameMoneytype = gameMoneytype;
	}
	public double getGameMoney() {
		return gameMoney;
	}
	public void setGameMoney(double gameMoney) {
		this.gameMoney = gameMoney;
	}	
	
}

package com.gly.entity;
/**
 * 支付类型
 * @author YG
 *
 */
public class consumetype {
	/**
	 * 编号
	 */
	private int consumetypeid;
	/**
	 * 支付类型
	 */
	private String consumetypename;	
	public int getConsumetypeid() {
		return consumetypeid;
	}
	public void setConsumetypeid(int consumetypeid) {
		this.consumetypeid = consumetypeid;
	}
	public String getConsumetypename() {
		return consumetypename;
	}
	public void setConsumetypename(String consumetypename) {
		this.consumetypename = consumetypename;
	}
}

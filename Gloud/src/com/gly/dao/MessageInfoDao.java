package com.gly.dao;

import java.util.List;

import com.gly.entity.MessageInfo;

/**
 * 反馈信息接口
 * @author YG
 *
 */
public interface MessageInfoDao {
	/**
	 * 获得所有反馈信息
	 * @return 反馈信息
	 */
	public List<MessageInfo> getALLMessageInfo();
	/**
	 * 反馈信息
	 * @param mi
	 * @return
	 */
	public int senterMessageInfo(MessageInfo mi);
	/**
	 * 删除反馈信息
	 * @param id
	 * @return
	 */
	public int delMessageInfo(int id);
}

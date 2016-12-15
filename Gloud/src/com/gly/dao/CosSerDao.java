package com.gly.dao;

import com.gly.entity.CosSer;

/**
 * 客服信息接口
 * @author YG
 *
 */
public interface CosSerDao {
	/**
	 * 获得客服信息
	 * @return 返回客服
	 */
	public CosSer getCosSerInfo();
	/**
	 * 修改客服信息
	 * @return
	 */
	public int upCosSerInfo(CosSer cs);
	
}

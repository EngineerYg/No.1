package com.gly.dao;

import java.util.ArrayList;
import java.util.List;

import com.gly.entity.SaveShop;

public interface SaveShopDao {
	public List<SaveShop> getallGameSaveShop(int gid);
	
	public SaveShop getSaveSopById(int id);
	
}

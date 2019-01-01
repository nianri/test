package com.yh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.Shop;
import com.yh.model.ShopCheck;

public interface ShopService {
	public int insertShop(Shop shop);
	public int updateShopById(Shop shop);
	public List<Shop> getShopAddList(Shop shop);
	public List<Shop> getShopList(Shop shop);
	public int updateShopStatus(Shop shop);
	public int deleteShop(String id);
	public List<Shop> getShopCheckList(Shop shop);
	public Shop getShopById(@Param("shopid") String shopid);
	public List<Shop> getShopByRight();
	public int saveShopXY(Shop shop);
	public int submitShopSetting(Shop shop);
	public int commitShopToCheck(Shop shop);
	public int commitCheckShop(ShopCheck shopCheck);
}

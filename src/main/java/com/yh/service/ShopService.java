package com.yh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.Shop;

public interface ShopService {
	public List<Shop> getShopList(Shop shop);
	public int updateShopStatus(Shop shop);
	public int deleteShop(String id);
	public List<Shop> getShopCheckList(Shop shop);
	public Shop getShopById(@Param("shopid") String shopid);
	public List<Shop> getShopByRight();
	public int saveShopXY(Shop shop);
	public int submitShopSetting(Shop shop);
}

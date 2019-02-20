package com.yh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.ShopCheck;

public interface ShopCheckService {
	public int insertShopCheck(ShopCheck shopCheck);
    public ShopCheck getShopCheckInfo(String shopId);
    public List<ShopCheck> getShopCheckLog(@Param("shopid") String shopid);   
}

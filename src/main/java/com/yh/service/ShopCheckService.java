package com.yh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.ShopCheck;

public interface ShopCheckService {
	int insert(ShopCheck record);
    int insertSelective(ShopCheck record);
    public ShopCheck getShopCheckInfo(String shopId);
    public int submitShopCheck(ShopCheck shopCheck);
    public List<ShopCheck> getShopCheckLog(@Param("shopid") String shopid);
}

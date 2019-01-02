package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.ShopCheck;

public interface ShopCheckMapper {
    int insertShopCheck(ShopCheck shopCheck);
    ShopCheck getShopCheckInfo(String shopId);
    int submitCheckShop(ShopCheck shopCheck);
    List<ShopCheck> getShopCheckLog(@Param("shopid") String shopid);
}
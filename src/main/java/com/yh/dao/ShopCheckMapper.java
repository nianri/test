package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.ShopCheck;

public interface ShopCheckMapper {
    int insert(ShopCheck record);
    int insertSelective(ShopCheck shopCheck);
    ShopCheck getShopCheckInfo(String shopId);
    int submitShopCheck(ShopCheck shopCheck);
    List<ShopCheck> getShopCheckLog(@Param("shopid") String shopid);
}
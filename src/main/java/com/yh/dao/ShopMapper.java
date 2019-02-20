package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.Shop;

public interface ShopMapper {
    int insertShop(Shop shop);
    int updateShopById(Shop shop);
    List<Shop> getShopAddList(Shop shop);
    List<Shop> getShopList(Shop shop);
    int updateShopStatus(Shop shop);
    int deleteShop(@Param("shopid") String shopid);
    List<Shop> getShopCheckList(Shop shop);
    Shop getShopById(@Param("shopid") String shopid);
    List<Shop> getShopByRight();
    int submitShopSetting(Shop shop);
}
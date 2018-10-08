package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.Shop;

public interface ShopMapper {
    int insert(Shop shop);
    int insertSelective(Shop shop);
    List<Shop> getShopList(Shop shop);
    int updateShopStatus(Shop shop);
    int deleteShop(@Param("shopid") String shopid);
    List<Shop> getShopCheckList(Shop shop);
    Shop getShopById(@Param("shopid") String shopid);
    List<Shop> getShopByRight();
    int saveShopXY(Shop shop);
}
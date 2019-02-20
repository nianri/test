package com.yh.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yh.model.ShopOils;

public interface ShopOilsMapper {
    int insertShopOils(ShopOils record);
    int insertSelective(ShopOils record);
    List<ShopOils> getShopOilsList(ShopOils shopOils);
    ShopOils getShopOilsById(@Param("shopoilsid") String shopoilsid); 
    int deleteShopOils(@Param("shopoilsid") String shopoilsid);
    int updateShopOilsById(ShopOils shopOils);
    List<ShopOils> isExistsShopOils(ShopOils shopOils);
}
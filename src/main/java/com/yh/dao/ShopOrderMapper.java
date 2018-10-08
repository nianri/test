package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.ShopOrder;

public interface ShopOrderMapper {
    int insertShopOrder(ShopOrder shopOrder);
    int insertSelective(ShopOrder shopOrder);
    List<ShopOrder> getShopOrderList(ShopOrder shopOrder);
    ShopOrder getShopOrderById(@Param("orderid") String orderId);
    List<ShopOrder> getShopOrderByMemberId(@Param("memberid") String memberId);
}
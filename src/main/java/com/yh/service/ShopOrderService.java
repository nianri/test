package com.yh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.ShopOrder;

public interface ShopOrderService {
	public int insertShopOrder(ShopOrder shopOrder);
	public List<ShopOrder> getShopOrderList(ShopOrder shopOrder);
	public ShopOrder getShopOrderById(@Param("orderid") String orderId);
	public List<ShopOrder> getShopOrderByMemberId(@Param("memberid") String memberId);
}

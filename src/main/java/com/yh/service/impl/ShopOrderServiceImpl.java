package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.yh.dao.ShopOrderMapper;
import com.yh.model.ShopOrder;
import com.yh.service.ShopOrderService;

@Service("shopOrderService") 
public class ShopOrderServiceImpl implements ShopOrderService{
	@Resource  
	private ShopOrderMapper shopOrderMapper;
	public int insertShopOrder(ShopOrder shopOrder){
		return shopOrderMapper.insertShopOrder(shopOrder);
	}
	public List<ShopOrder> getShopOrderList(ShopOrder shopOrder){
		return shopOrderMapper.getShopOrderList(shopOrder);
	}
	public ShopOrder getShopOrderById(@Param("orderid") String orderId){
		return shopOrderMapper.getShopOrderById(orderId);
	}
	public List<ShopOrder> getShopOrderByMemberId(@Param("memberid") String memberId){
		return shopOrderMapper.getShopOrderByMemberId(memberId);
	}
}

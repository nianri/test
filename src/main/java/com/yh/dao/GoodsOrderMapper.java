package com.yh.dao;

import com.yh.model.GoodsOrder;
import java.util.List;

public interface GoodsOrderMapper {
	/**
	 * 查询礼品兑换列表
	 * 
	 * @return
	 */
	List<GoodsOrder> getGoodsOrderList(GoodsOrder goodsOrder);

	/**
	 * 根据id查询一个
	 * 
	 * @return
	 */
	GoodsOrder getGoodsOrder(String orderid);

	/**
	 * 更新礼品兑换
	 * 
	 * @return
	 */
	void updateGoodsOrderById(GoodsOrder goodsOrder);
}
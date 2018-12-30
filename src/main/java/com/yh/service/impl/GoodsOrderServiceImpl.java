package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.yh.dao.GoodsOrderMapper;
import com.yh.model.GoodsOrder;
import com.yh.service.GoodsOrderService;

@Service("goodsOrderService")
public class GoodsOrderServiceImpl implements GoodsOrderService {

	@Resource
	private GoodsOrderMapper goodsOrderMapper;

	@Override
	public List<GoodsOrder> getGoodsOrderList(GoodsOrder goodsOrder) {
		return goodsOrderMapper.getGoodsOrderList(goodsOrder);
	}

	@Override
	public GoodsOrder getGoodsOrder(String orderid) {
		return goodsOrderMapper.getGoodsOrder(orderid);
	}

	@Override
	@Transactional
	public void updateGoodsOrder(GoodsOrder goodsOrder) {
		goodsOrderMapper.updateGoodsOrderById(goodsOrder);
	}
}

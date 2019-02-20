package com.yh.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.yh.dao.GoodsOrderMapper;
import com.yh.model.GoodsOrder;
import com.yh.service.BaseExportService;
import com.yh.service.GoodsOrderService;
import com.yh.utils.CommonUtils;

@Service("goodsOrderService")
public class GoodsOrderServiceImpl implements GoodsOrderService,BaseExportService {

	@Resource
	private GoodsOrderMapper goodsOrderMapper;

	@Override
	public List<GoodsOrder> getGoodsOrderList(GoodsOrder goodsOrder) {
		return goodsOrderMapper.getGoodsOrderList(goodsOrder);
	}
	
	/**
	 * 该方法暂时只在导出的时候用
	 * @param goodsOrder
	 * @return
	 */
	private int getGoodsOrderCount(GoodsOrder goodsOrder) {
		return goodsOrderMapper.getGoodsOrderList(goodsOrder).size();
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

	@Override
	public List<?> onePageExportData(String params) {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public int totalCount(String params) {
		GoodsOrder goodsOrder=JSONObject.parseObject(params, GoodsOrder.class);
		return getGoodsOrderCount(goodsOrder);
	}

	@Override
	public List<?> totalExportData(String params) {
		GoodsOrder goodsOrder=JSONObject.parseObject(params, GoodsOrder.class);
		return getGoodsOrderList(goodsOrder);
	}
}

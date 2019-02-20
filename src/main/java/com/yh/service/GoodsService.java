package com.yh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.Goods;

public interface GoodsService {
	public List<Goods> getGoodsList(Goods goods);
	public Goods getGoodsById(@Param("goodsid") String goodsId);
	public int deleteGoods(@Param("goodsid") String goodsId);
	public int insertGoods(Goods goods);
	public int updateGoodsById(Goods goods);
}

package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.yh.dao.GoodsMapper;
import com.yh.model.Goods;
import com.yh.service.GoodsService;

@Service("GoodsService") 
public class GoodsServiceImpl implements GoodsService{
	@Resource  
	private GoodsMapper goodsMapper;
	public List<Goods> getGoodsList(Goods goods){
		return goodsMapper.getGoodsList(goods);
	}
	public Goods getGoodsById(@Param("goodsid") String goodsId){
		return goodsMapper.getGoodsById(goodsId);
	}
	public int deleteGoods(@Param("goodsid") String goodsId){
		return goodsMapper.deleteGoods(goodsId);
	}
	public int insertGoods(Goods goods){
		return goodsMapper.insertGoods(goods);
	}
	public int updateGoodsById(Goods goods){
		return goodsMapper.updateGoodsById(goods);
	}
}

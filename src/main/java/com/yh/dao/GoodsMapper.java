package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
 
import com.yh.model.Goods;

public interface GoodsMapper {
    int insertGoods(Goods record);
    int insertSelective(Goods record);
    List<Goods> getGoodsList(Goods goods);
    Goods getGoodsById(@Param("goodsid") String goodsId); 
    int deleteGoods(@Param("goodsid") String goodsId);
    int updateGoodsById(Goods goods);
}
package com.yh.service;

import java.util.List;
import com.yh.model.GoodsOrder;
/**
 *	礼品兑换接口管理
 *  @Package  com.yh.service.GoodsOrderService
 *	@cfg.entiName 张金旺
 *	@version Ver 1.0 2018-12-26 18:27:39 新增
 */
public interface GoodsOrderService  {
        /**
         * 查询礼品兑换列表
         * @param GoodsOrder
         * @return
         */
        List<GoodsOrder> getGoodsOrderList(GoodsOrder GoodsOrder);

        /**
         * 查看礼品兑换详情
         * @param  orderid
         * @return
         */
        GoodsOrder getGoodsOrder(String  orderid);

        /**
         * 修改礼品兑换
         * @param GoodsOrder
         */
        void updateGoodsOrder(GoodsOrder GoodsOrder);
}

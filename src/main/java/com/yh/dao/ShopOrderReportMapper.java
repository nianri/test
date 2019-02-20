package com.yh.dao;
import com.yh.model.ShopOrderReport;
import java.util.List;
import java.util.Map;

public interface ShopOrderReportMapper{
    /**
    * 查询商家订单列表
    * @return
    */
    List<ShopOrderReport> getShopOrderStatusReportList(ShopOrderReport shopOrderReport);

    /**
     * 搜索产品统计报表
     * @param shopOrderReport
     * @return
     */
	List<ShopOrderReport> getShopOrderOilsReportList(ShopOrderReport shopOrderReport);
	/**
     * 搜索月收入统计报表
     * @param shopOrderReport
     * @return
     */
	List<ShopOrderReport> getShopOrderMonthReportList(ShopOrderReport shopOrderReport);
}
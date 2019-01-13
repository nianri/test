package com.yh.service;

import java.util.List;
import java.util.Map;

import com.yh.model.ShopOrderReport;
/**
 *	商家订单接口管理
 *  @Package  com.yh.service.ShopOrderReportService
 *	@cfg.entiName 张金旺
 *	@version Ver 1.0 2018-12-27 16:04:46 新增
 */
public interface ShopOrderReportService  {
        /**
         * 查询商家订单列表
         * @param ShopOrderReport
         * @return
         */
        List<ShopOrderReport> getShopOrderStatusReportList(ShopOrderReport ShopOrderReport);

        /**
         * 查看商家订单详情
         * @param  orderid
         * @return
         */
        ShopOrderReport getShopOrderStatusReport(String  orderid);

        /**
         * 搜索产品订单统计报表
         * @param shopOrderReport
         * @return
         */
		List<ShopOrderReport> getShopOrderOilsReportList(ShopOrderReport shopOrderReport);

		/**
		 * 查看产品订单统计详情
		 * @param shopOrderReportid
		 * @return
		 */
		ShopOrderReport getShopOrderOilsReport(String shopOrderReportid);
		/**
		 * 查看月收入统计详情
		 * @param shopOrderReportid
		 * @return
		 */
		ShopOrderReport getShopOrderMonthReport(String shopOrderReportid);

		/**
		 * 搜索月收入统计报表
		 * @param shopOrderReport
		 * @return
		 */
		List<ShopOrderReport> getShopOrderMonthReportList(ShopOrderReport shopOrderReport);
}

package com.yh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yh.model.ShopOrderReport;
import com.yh.service.ShopOrderReportService;


/**
 * 商家订单 管理
 * 
 * @Package com.yh.controller.ShopOrderReportController
 * @cfg.entiName 张金旺
 * @version Ver 1.0 2018-12-27 16:04:46 新增
 */
@Controller
@RequestMapping("shopOrderReport")
public class ShopOrderReportController {
	private static final Log logger = LogFactory.getLog(ShopOrderReportController.class);
	@Resource
	private ShopOrderReportService shopOrderReportService;

	/**
	 *
	 * shopOrderStatusReport(打开订单状态统计报表页面) 2018年12月25日
	 */
	@GetMapping("shopOrderStatusReport")
	public String shopOrderStatusReport() {
		logger.info("打开商家订单列表页面");
		return "shopOrderReport/shopOrderStatusReport";
	}

	/**
	 * 商家订单-列表-查询
	 * 
	 * @param shopOrderReport
	 * @return
	 */
	@RequestMapping(value = { "getShopOrderStatusReportList" }, method = { RequestMethod.POST }, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<ShopOrderReport> getShopOrderStatusReportList(@RequestBody ShopOrderReport shopOrderReport) {
		List<ShopOrderReport> shopOrderReportList = new ArrayList<ShopOrderReport>();
		try {
			shopOrderReportList = shopOrderReportService.getShopOrderStatusReportList(shopOrderReport);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return shopOrderReportList;
	}

	// 查看商家订单详情
	@GetMapping("getShopOrderStatusReport/{shopOrderReportid}")
	public String getShopOrderStatusReport(@PathVariable(name = "shopOrderReportid") String shopOrderReportid, Model model) {
		if (shopOrderReportid.trim().length() <= 0)
			return "";
		ShopOrderReport shopOrderReport = new ShopOrderReport();
		shopOrderReport = shopOrderReportService.getShopOrderStatusReport(shopOrderReportid);
		model.addAttribute("info", shopOrderReport);
		return "shopOrderReport/shopOrderStatusReportDetail";
	}
	
	/**
	 *
	 * shopOrderOilsReport(打开产品订单统计报表页面) 2018年12月25日
	 */
	@GetMapping("shopOrderOilsReport")
	public String shopOrderOilsReport() {
		logger.info("打开产品订单统计报表页面");
		return "shopOrderReport/shopOrderOilsReport";
	}

	/**
	 * 商家订单-列表-查询
	 * 
	 * @param shopOrderReport
	 * @return
	 */
	@RequestMapping(value = { "getShopOrderOilsReportList" }, method = { RequestMethod.POST }, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<ShopOrderReport> getShopOrderOilsReportList(@RequestBody ShopOrderReport shopOrderReport) {
		List<ShopOrderReport> shopOrderReportList = new ArrayList<ShopOrderReport>();
		try {
			shopOrderReportList = shopOrderReportService.getShopOrderOilsReportList(shopOrderReport);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return shopOrderReportList;
	}

	// 查看商家订单详情
	@GetMapping("getShopOrderOilsReport/{shopOrderReportid}")
	public String getShopOrderOilsReport(@PathVariable(name = "shopOrderReportid") String shopOrderReportid, Model model) {
		if (shopOrderReportid.trim().length() <= 0)
			return "";
		ShopOrderReport map = shopOrderReportService.getShopOrderOilsReport(shopOrderReportid);
		model.addAttribute("info", map);
		return "shopOrderReport/shopOrderOilsReportDetail";
	}
	
	/**
	 *
	 * shopOrderMonthReport(打开月收入统计报表页面) 2018年12月25日
	 */
	@GetMapping("shopOrderMonthReport")
	public String shopOrderMonthReport() {
		logger.info("打开产品订单统计报表页面");
		return "shopOrderReport/shopOrderMonthReport";
	}

	/**
	 * 商家订单-列表-查询
	 * 
	 * @param shopOrderReport
	 * @return
	 */
	@RequestMapping(value = { "getShopOrderMonthReportList" }, method = { RequestMethod.POST }, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<ShopOrderReport> getShopOrderMonthReportList(@RequestBody ShopOrderReport shopOrderReport) {
		List<ShopOrderReport> shopOrderReportList = new ArrayList<ShopOrderReport>();
		try {
			shopOrderReportList = shopOrderReportService.getShopOrderMonthReportList(shopOrderReport);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return shopOrderReportList;
	}

	// 查看商家订单详情
	@GetMapping("getShopOrderMonthReport/{shopOrderReportid}")
	public String getShopOrderMonthReport(@PathVariable(name = "shopOrderReportid") String shopOrderReportid, Model model) {
		if (shopOrderReportid.trim().length() <= 0)
			return "";
		ShopOrderReport map = shopOrderReportService.getShopOrderMonthReport(shopOrderReportid);
		model.addAttribute("info", map);
		return "shopOrderReport/shopOrderMonthReportDetail";
	}
}

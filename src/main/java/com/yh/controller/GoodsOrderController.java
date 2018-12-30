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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.yh.model.GoodsOrder;
import com.yh.service.GoodsOrderService;


/**
 * 礼品兑换 管理
 * 
 * @Package com.yh.controller.GoodsOrderController
 * @cfg.entiName 张金旺
 * @version Ver 1.0 2018-12-26 18:27:39 新增
 */
@Controller
@RequestMapping("goodsOrder")
public class GoodsOrderController {
	private static final Log logger = LogFactory.getLog(GoodsOrderController.class);
	@Resource
	private GoodsOrderService goodsOrderService;

	/**
	 *
	 * goodsOrderList(打开礼品兑换列表页面) 2018年12月25日
	 */
	@GetMapping("goodsOrderList")
	public String goodsOrderList() {
		logger.info("打开礼品兑换列表页面");
		return "goodsOrder/goodsOrder_list";
	}

	/**
	 * 礼品兑换-列表-查询
	 * 
	 * @param goodsOrder
	 * @return
	 */
	@RequestMapping(value = { "getGoodsOrderList" }, method = { RequestMethod.POST }, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<GoodsOrder> getGoodsOrderList(@RequestBody GoodsOrder goodsOrder) {
		List<GoodsOrder> goodsOrderList = new ArrayList<GoodsOrder>();
		try {
			goodsOrderList = goodsOrderService.getGoodsOrderList(goodsOrder);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return goodsOrderList;
	}

	// 查看礼品兑换详情
	@GetMapping("getGoodsOrder/{goodsOrderid}")
	public String getGoodsOrder(@PathVariable(name = "goodsOrderid") String goodsOrderid, Model model) {
		if (goodsOrderid.trim().length() <= 0)
			return "";
		GoodsOrder goodsOrder = new GoodsOrder();
		goodsOrder = goodsOrderService.getGoodsOrder(goodsOrderid);
		model.addAttribute("goodsOrder", goodsOrder);
		return "goodsOrder/goodsOrder_detail";
	}

	@PostMapping("updateGoodsOrder")
	@ResponseBody
	public Object updateGoodsOrder(@RequestBody GoodsOrder goodsOrder) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try {
			goodsOrderService.updateGoodsOrder(goodsOrder);
			resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
			resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
		} catch (Exception ex) {
			resultInfo.setCode(ResultEnum.ERROR.getCode());
			resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
		return resultInfo;
	}
}

package com.yh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.yh.common.common;
import com.yh.model.Goods; 
import com.yh.service.GoodsService;

@Controller
@RequestMapping({"/goods"})
public class GoodsController {
	private static final Log logger = LogFactory.getLog(ShopController.class);
	@Resource
	private GoodsService goodsService ;
	
	@RequestMapping(value = {"goodsList"}, method = {RequestMethod.GET})
	public String goodsList() {
		logger.info("打开-积分商品列表");
		return "goods/goods_list";		
	}
	/**
	 * 积分商品-列表-查询
	 * @param goods
	 * @return
	 */
	@RequestMapping(value = {"goodsSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<Goods> goodsSearch(@RequestBody Goods goods) {
		List<Goods> goodsList = new ArrayList<Goods>();		
		try{
			goodsList=goodsService.getGoodsList(goods);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
        return goodsList;
	}
	//添加商品
	@RequestMapping(value = {"addGoods"}, method = {RequestMethod.GET})
	public String addGoods() {
		return "goods/goods_add";
	}
	//编辑商品
	@RequestMapping(value = {"editGoods/{goodsid}"}, method = {RequestMethod.GET})
	public String editGoods(@PathVariable(name ="goodsid") String goodsId, Model model) {
		if(goodsId.trim().length()<=0) return "";
		Goods goods = new Goods();
		goods=goodsService.getGoodsById(goodsId); 
		model.addAttribute("goods", goods); 
		return "goods/goods_add";
	}
	//删除商品
	@RequestMapping(value = {"deleteGoods/{goodsid}"}, method = {RequestMethod.POST})
	public @ResponseBody Object deleteGoods(@PathVariable(name ="goodsid") String goodsId, Model model) {
		if(goodsId.trim().length()<=0) return "";
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			goodsService.deleteGoods(goodsId);
			resultInfo.setCode(ResultEnum.DELETE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.DELETE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
		return resultInfo;
	}
	//保存商品
	@RequestMapping(value = {"saveGoods"}, method = {RequestMethod.POST})
	public @ResponseBody Object saveGoods(@RequestBody Goods goods) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();	
		System.out.println(JSON.toJSON(goods));
		try{
			if(goods.getGoodsid()!=null && !"".equals(goods.getGoodsid())){
				goodsService.updateGoodsById(goods);
			}else{
				goods.setGoodsid(UUID.randomUUID().toString());
				goods.setCreatetime(common.GetNowDate().toString());
				goods.setIsdelete("1");
				goodsService.insertGoods(goods);
			}				
			resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
		return resultInfo;
	}
}

package com.yh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.yh.common.ImgConfig;
import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.yh.common.common;
import com.yh.model.AdvertInfo;
import com.yh.model.Area;
import com.yh.service.AdvertService;
import com.yh.service.AreaService;

@Controller
@RequestMapping({ "/advertin" })
public class AdvertController {
	private static final Log logger = LogFactory.getLog(AdvertController.class);
	@Resource
	private AdvertService advertService;
	@Resource
	private AreaService areaService;

	@Autowired
	private ImgConfig imageConfig; //引用统一的参数配置类

	// 广告管理页
	@RequestMapping(value = { "advertList" }, method = { RequestMethod.GET })
	public String advertList(Model model) {
		// Integer pageNo, Integer pageSize, String adName, Model model
		// model.addAttribute("pageNo", pageNo);
		// model.addAttribute("pageSize", pageSize);
		// model.addAttribute("adName", adName);
		logger.info("广告管理页...");
		System.out.println("8888");
		return "advert/advert_list";
	}

	@RequestMapping(value = { "Ad1" }, method = { RequestMethod.POST })
	public @ResponseBody Object Ad1(Model model) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		resultInfo.setCode("A");
		resultInfo.setInfo("B");
		System.out.print("------------------000");
		return resultInfo;
	}

	// 广告列表-查询
	@RequestMapping(value = { "advertSearch" }, method = { RequestMethod.POST }, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<AdvertInfo> advertSearch(@RequestBody AdvertInfo advertInfo) {
		List<AdvertInfo> adList = new ArrayList<AdvertInfo>();
		try {
			adList=advertService.getAllAdvert(advertInfo);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return adList;
	}

	// 添加广告
	@RequestMapping(value = { "addAdvert" }, method = { RequestMethod.GET })
	public String addAdvert(Model model) {
		model.addAttribute("uploadImgService", imageConfig.uploadImgService);
		//// model.addAttribute("imagePath", imageConfig.imagePath);
		return "advert/advert_add";
	}

	// 编辑广告
	@RequestMapping(value = { "editAdvert/{advertid}" }, method = { RequestMethod.GET })
	public String editAdvert(@PathVariable(name = "advertid") String advertId, Model model) {

		if (advertId.trim().length() <= 0)
			return "";
		AdvertInfo advertInfo = new AdvertInfo();
		advertInfo=advertService.getAdvertById(advertId);
		advertInfo.setImageurl(imageConfig.viewImgService+advertInfo.getImageurl());
		model.addAttribute("advertInfo", advertInfo);
		model.addAttribute("uploadImgService", imageConfig.uploadImgService);
		return "advert/advert_add";
	}

	// 删除广告
	@RequestMapping(value = { "deleteAdvert/{advertid}" }, method = { RequestMethod.POST })
	public @ResponseBody Object deleteAdvert(@PathVariable(name = "advertid") String advertId, Model model) {
		if (advertId.trim().length() <= 0)
			return "";
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try {
			AdvertInfo advertInfo = new AdvertInfo();
			advertInfo.setAdvertid(advertId);
			advertService.deleteAdvertById(advertInfo);
			resultInfo.setCode(ResultEnum.DELETE_SUCCESS.getCode());
			resultInfo.setInfo(ResultEnum.DELETE_SUCCESS.getInfo());
		} catch (Exception ex) {
			resultInfo.setCode(ResultEnum.ERROR.getCode());
			resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
		return resultInfo;
	}
	/**
	 * 保存广告
	 * @param advertInfo
	 * @return
	 */
	@RequestMapping(value = { "saveAdvert" }, method = { RequestMethod.POST })
	public @ResponseBody Object saveAdvert(@RequestBody AdvertInfo advertInfo) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		System.out.println(JSON.toJSON(advertInfo));
		int returnrows=0;
		try {
			returnrows=0;
			if (advertInfo.getAdvertid() != null && !"".equals(advertInfo.getAdvertid())) {
				advertInfo.setCreatetime(common.GetNowDate().toString());
				System.out.println("0|"+returnrows);
				returnrows=advertService.updateAdvertById(advertInfo);
				System.out.println("1|"+returnrows);
			} else {
				advertInfo.setAdvertid(UUID.randomUUID().toString());
				advertInfo.setCreatetime(common.GetNowDate().toString());
				//// ad.setImageurl(ad.getImageurl());
				advertInfo.setOrdernum("0");
				returnrows=advertService.insertAdvert(advertInfo);
				System.out.println("2|"+returnrows);
			}
			resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
			resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
			System.out.println("3|"+returnrows);
		} catch (Exception ex) {
			returnrows=0;
			resultInfo.setCode(ResultEnum.ERROR.getCode());
			resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
			System.out.println("4|"+ ex.getMessage() );
		}
		return resultInfo;
	}

	@RequestMapping("/getArea/{parentId}")
	public @ResponseBody List<Area> getArea(@PathVariable(name = "parentId") String parentId) {

		List<Area> areaList = new ArrayList<Area>();
		try {
			Area area = new Area();
			area.setParentid(parentId);
			areaList = areaService.getArea(area);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return areaList;
	}

}

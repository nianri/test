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
import com.yh.common.Common;
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


	// 广告管理页
	@RequestMapping(value = { "advertList" }, method = { RequestMethod.GET })
	public String advertList(Model model) {
		return "advert/advert_list";
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
	public String addAdvert() {
		return "advert/advert_add";
	}

	// 编辑广告
	@RequestMapping(value = { "editAdvert/{advertId}" }, method = { RequestMethod.GET })
	public String editAdvert(@PathVariable(name = "advertId") String advertId, Model model) {
		if (advertId==null|| "".equals(advertId.trim()))	return "advert/advert_list";
		AdvertInfo advertInfo = new AdvertInfo();
		advertInfo=advertService.getAdvertById(advertId);
		model.addAttribute("advertInfo", advertInfo);
		return "advert/advert_add";
	}

	// 删除广告
	@RequestMapping(value = { "deleteAdvert/{advertId}" }, method = { RequestMethod.POST })
	public @ResponseBody Object deleteAdvert(@PathVariable(name = "advertId") String advertId) {
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
			if (advertInfo.getAdvertid() != null && !"".equals(advertInfo.getAdvertid())) {
				returnrows=advertService.updateAdvertById(advertInfo); 
			} else {
				advertInfo.setAdvertid(UUID.randomUUID().toString());
				advertInfo.setCreatetime(Common.GetNowDate().toString());
				advertInfo.setCreatorid(Common.getSession().getAttribute("userid").toString());
				advertInfo.setOrdernum(Common.getRandomIndex());
				returnrows=advertService.insertAdvert(advertInfo); 
			}
			if(returnrows>0){
				resultInfo.setCode(ResultEnum.SUCCESS.getCode());
				resultInfo.setInfo(ResultEnum.SUCCESS.getInfo()); 
			}else{
				resultInfo.setCode(ResultEnum.FAILED.getCode());
				resultInfo.setInfo(ResultEnum.FAILED.getInfo()); 
			}
			
		} catch (Exception ex) { 
			resultInfo.setCode(ResultEnum.FAILED.getCode());
			resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			logger.error(ex.getMessage()); 
		}
		return resultInfo;
	}
	/**
	 * 获取广告所处的省、市
	 * @param parentId
	 * @return
	 */
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

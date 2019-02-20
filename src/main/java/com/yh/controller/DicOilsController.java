package com.yh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yh.model.DicOils;
import com.yh.service.DicOilsService;
@Controller
@RequestMapping({"/oils"})
public class DicOilsController {
	private static final Log logger = LogFactory.getLog(ShopController.class);
	@Resource
	private DicOilsService dicOilsService;
	/**
	 * 获取所有产品编码、名称等
	 * @return
	 */
	@RequestMapping(value = {"getDicOilsAllList"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<DicOils> getDicOilsAllList() {
		List<DicOils> dicOilsList = new ArrayList<DicOils>();		
		try{
			dicOilsList=dicOilsService.getDicOilsAllList();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			logger.info(ex.getMessage());
		}
        return dicOilsList;
	}
}

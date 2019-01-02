package com.yh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yh.model.Area;
import com.yh.service.AreaService;
@Controller
@RequestMapping({"/system"})
public class SystemController {
	private static final Log logger = LogFactory.getLog(SystemController.class);
	@Resource
	private AreaService areaService;
	
	@RequestMapping("/getArea/{parentId}")
	public @ResponseBody List<Area> getArea(@PathVariable(name = "parentId") String parentId) {

		List<Area> areaList = new ArrayList<Area>();
		try {
			Area area = new Area();
			area.setParentid(parentId);
			areaList = areaService.getArea(area);
		} catch (Exception ex) {
			logger.error(ex.getMessage());;
		}
		return areaList;
	}
}

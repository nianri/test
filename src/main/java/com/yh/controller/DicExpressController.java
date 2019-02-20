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
import com.yh.model.DicExpress;
import com.yh.service.DicExpressService;

/**
 *
 *
 * 项目名称：yh
 * 类名称：DicExpressController
 * 类描述：    快递公司
 * 创建人：jw
 * 创建时间：2018年12月25日 下午12:19:56
 * 修改人：jw
 * 修改时间：2018年12月25日 下午12:19:56
 * 修改备注：
 * @version
 *
 */
/**
 * 快递公司 管理
 * 
 * @Package com.yh.controller.DicExpressController
 * @cfg.entiName 张金旺
 * @version Ver 1.0 2018-12-26 20:54:01 新增
 */
@Controller
@RequestMapping("dicExpress")
public class DicExpressController {
	private static final Log logger = LogFactory.getLog(DicExpressController.class);
	@Resource
	private DicExpressService dicExpressService;

	/**
	 * 快递公司-列表-查询
	 * 
	 * @param dicExpress
	 * @return
	 */
	@RequestMapping(value = { "getDicExpressList" }, method = { RequestMethod.POST }, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<DicExpress> getDicExpressList(@RequestBody DicExpress dicExpress) {
		List<DicExpress> dicExpressList = new ArrayList<DicExpress>();
		try {
			dicExpressList = dicExpressService.getDicExpressList(dicExpress);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return dicExpressList;
	}
}

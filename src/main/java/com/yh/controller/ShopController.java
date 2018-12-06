package com.yh.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import com.yh.model.Shop;
import com.yh.model.ShopCheck;
import com.yh.model.SysUser;
import com.yh.service.ShopCheckService;
import com.yh.service.ShopService;
import com.yh.service.SysUserService;

@Controller
@RequestMapping({"/shop"})
public class ShopController {
	private static final Log logger = LogFactory.getLog(ShopController.class);
	@Resource
	private ShopService shopService;
	@Resource
	private ShopCheckService shopCheckService;
	@Resource
	private SysUserService sysUserService;
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	
	/**
	 * 加油站列表
	 * @return
	 */
	@RequestMapping(value = {"shopList"}, method = {RequestMethod.GET})
	public String shopList() {
		logger.info("打开-加油站列表");
		return "shop/shop_list";		
	}
	/**
	 * 加油站列表-查询
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"shopSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<Shop> shopSearch(@RequestBody Shop shop) {
		List<Shop> shopList = new ArrayList<Shop>();		
		try{
			shopList=shopService.getShopList(shop);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		System.out.println("条目："+shopList.size());
        return shopList;
	}
	/**
	 * 删除加油站(伪删除)
	 * @param shopId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"deleteShop/{shopid}"}, method = {RequestMethod.POST})
	public @ResponseBody Object deleteShop(@PathVariable(name ="shopid") String shopId, Model model) {
		if(shopId.trim().length()<=0) return "";
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			shopService.deleteShop(shopId);
			resultInfo.setCode(ResultEnum.DELETE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.DELETE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
	}	
	/**
	 * 加油站启动与禁用
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"updateShopStatus"}, method = {RequestMethod.POST})
	public @ResponseBody Object updateShopStatus(@RequestBody Shop shop) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			shopService.updateShopStatus(shop);			
			resultInfo.setCode(ResultEnum.DELETE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.DELETE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
	}
	/**
	 * 加油站详情
	 * @param shopId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"shopDetail/{shopid}"}, method = {RequestMethod.GET})
	public String shopDetail(@PathVariable(name ="shopid") String shopId, Model model) {
		List<ShopCheck> shopCheck = new ArrayList<ShopCheck>();		
		Shop shop = new Shop();
		try{
			shop=shopService.getShopById(shopId);			
			shopCheck=shopCheckService.getShopCheckLog(shopId);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		model.addAttribute("shop", shop);
		model.addAttribute("shopcheck", shopCheck);
		return "shop/shop_detail";		
	}
	/**
	 * 入驻审核-列表页
	 * @return
	 */
	@RequestMapping(value = {"shopCheckList"}, method = {RequestMethod.GET})
	public String shopCheckList() {	 
		return "shop/shop_checklist";		
	}	
	/**
	 * 入驻审核-列表-查询
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"getShopCheckList"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<Shop> getShopCheckList(@RequestBody Shop shop) {
		List<Shop> shopList = new ArrayList<Shop>();		
		try{
			shopList=shopService.getShopCheckList(shop);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
        return shopList;
	}
	/**
	 * 入驻审核-列表-单个审核
	 * @param shopId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"shopCheck/{shopid}"}, method = {RequestMethod.GET})
	public String shopCheck(@PathVariable(name ="shopid") String shopId,Model model) {	 
		Shop shop = new Shop();
		ShopCheck shopCheck =new ShopCheck();
		try{
			shop=shopService.getShopById(shopId);
			model.addAttribute("shop", shop);
			shopCheck=shopCheckService.getShopCheckInfo(shopId);		
			model.addAttribute("check", shopCheck);
			System.out.println(JSON.toJSON(shop));
		}catch(Exception ex){
			logger.error(ex.getMessage());
		}	
		return "shop/shop_checkpop";		
	}
	/**
	 * 提交加油站审核信息
	 * @param shop
	 * @return
	 */	
	@RequestMapping(value = {"submitShopCheck"}, method = {RequestMethod.POST})
	public @ResponseBody Object submitShopCheck(@RequestBody ShopCheck shopCheck,HttpServletRequest request) {
		shopCheck.setChecktime(df.format(new Date()));
		shopCheck.setAuditorid(request.getSession().getAttribute("userid").toString());
		
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			shopCheckService.submitShopCheck(shopCheck);			
			resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
	}
	/**
	 * 获取店铺审核流水
	 * @param shopId
	 * @return
	 */
	@RequestMapping(value = {"getShopCheckLog/{shopid}"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<ShopCheck> getShopCheckLog(@PathVariable(name ="shopid") String shopId) {
		List<ShopCheck> shopCheck = new ArrayList<ShopCheck>();		
		try{
			shopCheck=shopCheckService.getShopCheckLog(shopId);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
        return shopCheck;
	}
	/**
	 * 获取用户可访问的店铺(油站)
	 * @return
	 */	
	@RequestMapping(value = {"getShopByRight"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public @ResponseBody List<Shop> getShopByRight(){
		String logincode=Common.getSession().getAttribute("logincode").toString();
		List<Shop> shopList = new ArrayList<Shop>();
		Shop shop = new Shop();
		try{
			SysUser user=sysUserService.getSysUserByCode(logincode);
			if("1".equals(user.getUsertype()) && user.getShopid().length()>0){
				//0:无1:商家2:运营人员3:管理员
				shop=shopService.getShopById(user.getShopid());
				shopList.add(shop);				
			}else if("2".equals(user.getUsertype())||"3".equals(user.getUsertype())){
				//运营人员或管理员
				shopList=shopService.getShopByRight();				
			}else{
				System.out.println("判断异常！");
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			logger.info(ex.getMessage());
		}
		return shopList;
	}
	/**
	 * 打开加油站地图
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"shopMap"}, method = {RequestMethod.GET})
	public String shopMap(Model model) {	
		Shop shop = new Shop();
		shop=shopService.getShopById(Common.getSession().getAttribute("shopid").toString());
		model.addAttribute("shop", shop);
		return "shop/shop_map";		
	}	
	/**
	 * 设置商家经纬度x,y
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"saveShopXY"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody Object saveShopXY(@RequestBody Shop shop) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			shopService.saveShopXY(shop);			
			resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
	}
	/**
	 * 打开商家信息维护页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"shopSetting"}, method = {RequestMethod.GET})
	public String shopSetting(Model model) {	
		Shop shop = new Shop();
		shop=shopService.getShopById(Common.getSession().getAttribute("shopid").toString());
		model.addAttribute("shop", shop);
		return "shop/shop_setting";		
	}
	/**
	 * 提交商家信息维护数据
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"submitShopSetting"}, method = {RequestMethod.POST})
	public @ResponseBody Object submitShopSetting(@RequestBody Shop shop) {		
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			if(shop.getAccountbank()==null||"".equals(shop.getAccountbank())){
				resultInfo.setCode(ResultEnum.ERROR.getCode());
		        resultInfo.setInfo("开户银行不能为空！");
				return resultInfo;
			}
			if(shop.getAccountnums()==null||"".equals(shop.getAccountnums())){
				resultInfo.setCode(ResultEnum.ERROR.getCode());
		        resultInfo.setInfo("开户银行卡号不能为空！");
				return resultInfo;
			}
			if(shop.getAccountname()==null||"".equals(shop.getAccountname())){
				resultInfo.setCode(ResultEnum.ERROR.getCode());
		        resultInfo.setInfo("开户人姓名不能为空！");
				return resultInfo;
			}
			if(shopService.submitShopSetting(shop)>0){
				resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
		        resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
			}else{		
				resultInfo.setCode(ResultEnum.ERROR.getCode());
		        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			}
			
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
	}
}

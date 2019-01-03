package com.yh.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
	//@Autowired
	//private ImgConfig imageConfig; //引用统一的参数配置类
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		
	/**
	 * 加油站入驻-列表
	 * @return
	 */
	@RequestMapping(value = {"shopAddList"}, method = {RequestMethod.GET})
	public String shopAddList() {	 
		return "shop/shop_addlist";		
	}
	/**
	 * 加油站入驻-搜索
	 * 搜索未申请、待审核、审核失败的加油站
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"shopAddSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<Shop> shopAddSearch(@RequestBody Shop shop) {
		List<Shop> shopList = new ArrayList<Shop>();		
		try{
			shopList=shopService.getShopAddList(shop);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
        return shopList;
	}
	/**
	 * 加油站入驻-填报
	 * @return
	 */
	@RequestMapping(value = {"shopAddInfo"}, method = {RequestMethod.GET})
	public String shopAddInfo(Model model) {
		return "shop/shop_addinfo";		
	}
	/**
	 * 加油站入驻-编辑
	 * @return
	 */
	@RequestMapping(value = {"shopEditInfo/{shopId}"}, method = {RequestMethod.GET})
	public String shopEditInfo(@PathVariable(name = "shopId") String shopId,Model model) {
		Shop shop = shopService.getShopById(shopId);
		if("3".equals(shop.getStatus())||"4".equals(shop.getStatus())){
			return "shop/shop_account"; //此处需要校验，非常重要
		}else{
			model.addAttribute("shop", shop);
		}
		return "shop/shop_addinfo";		
	}
	/**
	 * 加油站入驻-信息提交
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"commitShopInfo"}, method = {RequestMethod.POST})
	public @ResponseBody Object commitShopInfo(@RequestBody Shop shop) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		resultInfo.setCode(ResultEnum.FAILED.getCode());
		if(shop.getShopname()==null||"".equals(shop.getShopname())) {
			 resultInfo.setInfo("请输入加油站名称！");
			return resultInfo;
		}
		if(shop.getProvinceid()==null||"".equals(shop.getProvinceid())) {
			resultInfo.setInfo("请选择省！");
			return resultInfo;
		}
		if(shop.getCityid()==null||"".equals(shop.getCityid())) {
			resultInfo.setInfo("请选择市！");
			return resultInfo;
		}
		if(shop.getCountyid()==null||"".equals(shop.getCountyid())) {
			resultInfo.setInfo("请选择县(区)！");
			return resultInfo;
		}
		if(shop.getAddress()==null||"".equals(shop.getAddress())) {
			resultInfo.setInfo("请输入详细地址！");
			return resultInfo;
		}
		if(shop.getLeadername()==null||"".equals(shop.getLeadername())) {
			resultInfo.setInfo("请输入负责人姓名！");
			return resultInfo;
		}
		if(shop.getLeadertel()==null||"".equals(shop.getLeadertel())) {
			resultInfo.setInfo("请输入负责人电话！");
			return resultInfo;
		}
		if(shop.getLeaderemail()==null||"".equals(shop.getLeaderemail())) {
			resultInfo.setInfo("请输入负责人邮箱！");
			return resultInfo;
		}
		if(shop.getShoplevel()==null||"".equals(shop.getShoplevel())) {
			resultInfo.setInfo("请选择商户星级！");
			return resultInfo;
		}
		if(shop.getCusid()==null||"".equals(shop.getCusid())) {
			resultInfo.setInfo("请输入商户号！");
			return resultInfo;
		} 
		if(shop.getAppid()==null||"".equals(shop.getAppid())) {
			resultInfo.setInfo("请输入商户AppId！");
			return resultInfo;
		} 
		if(shop.getAppkey()==null||"".equals(shop.getAppkey())) {
			resultInfo.setInfo("请输入商户AppKey！");
			return resultInfo;
		}		
		if(shop.getLongitude()==null||"".equals(shop.getLongitude())) {
			resultInfo.setInfo("请输入正确的经度！");
			return resultInfo;
		}
		if(shop.getLatitude()==null||"".equals(shop.getLatitude())) {
			resultInfo.setInfo("请输入正确的纬度！");
			return resultInfo;
		}
		if(shop.getShopimg()==null||"".equals(shop.getShopimg())) {
			resultInfo.setInfo("请上传商家油站图！");
			return resultInfo;
		} 
		if(shop.getLicenseimg()==null||"".equals(shop.getLicenseimg())) {
			resultInfo.setInfo("请上传营业执照！");
			return resultInfo;
		} 
		if(shop.getProlicenseimg()==null||"".equals(shop.getProlicenseimg())) {
			resultInfo.setInfo("请上传成品油许可证！");
			return resultInfo;
		} 
		if(shop.getCardtop()==null||"".equals(shop.getCardtop())) {
			resultInfo.setInfo("请上传身份证正面照！");
			return resultInfo;
		} 
		if(shop.getCarddown()==null||"".equals(shop.getCarddown())) {
			resultInfo.setInfo("请上传身份证反面照！");
			return resultInfo;
		}
		try{
			int returnRows=0;
			if(shop.getShopid()!=null&&!"".equals(shop.getShopid())){
				returnRows=shopService.updateShopById(shop);
			}else{
				shop.setShopid(Common.createUUid());
				shop.setCreatetime(Common.GetNowDate());
				shop.setStatus("0");
				shop.setIsdelete("1");
				shop.setShopsources("1");
				shop.setCreatorid(Common.getSession().getAttribute("userid").toString());
				returnRows=shopService.insertShop(shop);
			}
			if(returnRows==1){
				resultInfo.setCode(ResultEnum.SUCCESS.getCode());
		        resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
			}else{
				resultInfo.setCode(ResultEnum.FAILED.getCode());
		        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			}
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.FAILED.getCode());
	        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
	}
	/**
	 * 提交商家信息进行审核
	 * @param shopId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"commitShopToCheck/{shopId}"}, method = {RequestMethod.POST})
	public @ResponseBody Object commitShopToCheck(@PathVariable(name ="shopId") String shopId) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		if(shopId==null||"".equals(shopId)){
			resultInfo.setCode(ResultEnum.FAILED.getCode());
	        resultInfo.setInfo("商家信息无效！");
	        return resultInfo;
		}
		try{
			resultInfo.setCode(ResultEnum.FAILED.getCode());
			Shop shop = shopService.getShopById(shopId);
			if(shop==null){
				resultInfo.setInfo("商家信息不存在！");
		        return resultInfo;
			}
			//未申请、审核未通过
			if( !shop.getStatus().equals("0")&& !shop.getStatus().equals("2") ){
				resultInfo.setInfo("商家信息已提交审核！");
		        return resultInfo;
			}			
			int returnRows=shopService.commitShopToCheck(shop);
			if(returnRows>0){
				resultInfo.setCode(ResultEnum.SUCCESS.getCode());			
				resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
			}else{
	        	resultInfo.setCode(ResultEnum.FAILED.getCode());			
				resultInfo.setInfo(ResultEnum.FAILED.getInfo());
	        }
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.FAILED.getCode());
	        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
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
	 * 入驻审核-列表页-查询
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = {"getShopCheckList"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<Shop> getShopCheckList(@RequestBody Shop shop) {
		List<Shop> shopList = new ArrayList<Shop>();		
		try{
			shopList=shopService.getShopCheckList(shop);
		}catch(Exception ex){
			logger.debug(ex.getMessage());
		}
        return shopList;
	}
	
	
	
	/**
	 * 入驻审核-列表页-单个审核
	 * @param shopId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"checkShopInfo/{shopid}"}, method = {RequestMethod.GET})
	public String checkShopInfo(@PathVariable(name ="shopid") String shopId,Model model) {	 
		Shop shop = new Shop();
		ShopCheck shopCheck =new ShopCheck();
		try{
			shop=shopService.getShopById(shopId);
			model.addAttribute("shop", shop);
			shopCheck=shopCheckService.getShopCheckInfo(shopId);		
			model.addAttribute("check", shopCheck);
		}catch(Exception ex){
			logger.error(ex.getMessage());
		}	
		return "shop/shop_checkshopinfo";		
	}
	/**
	 * 提交审核商家信息的意见和状态
	 * @param shop
	 * @return
	 */
	
	@RequestMapping(value = {"commitCheckShop"}, method = {RequestMethod.POST})
	public @ResponseBody Object commitCheckShop(@RequestBody ShopCheck shopCheck) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		logger.info(JSON.toJSON(shopCheck));
		resultInfo.setCode(ResultEnum.FAILED.getCode());
		if(shopCheck==null||shopCheck.getScheckid()==null||"".equals(shopCheck.getScheckid())
			||shopCheck.getShopid()==null||"".equals(shopCheck.getShopid())){
	        resultInfo.setInfo("审核信息未提交或异常！");
			return resultInfo;
		}
		if(shopCheck.getStatus()==null||"".equals(shopCheck.getStatus())){
	        resultInfo.setInfo("请提交审核状态！");
			return resultInfo;
		}
		if(shopCheck.getCheckdesc()==null||"".equals(shopCheck.getCheckdesc())){
	        resultInfo.setInfo("请提交审核意见！");
			return resultInfo;
		}
		try{
			int returnRows=shopService.commitCheckShop(shopCheck);
			if(returnRows>0){
				resultInfo.setCode(ResultEnum.SUCCESS.getCode());
		        resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
			}else{
				resultInfo.setCode(ResultEnum.FAILED.getCode());
		        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			}
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.FAILED.getCode());
	        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			logger.error(ex.getMessage());
		}		
		return resultInfo;
	}
	
	/**
	 * 加油站-列表
	 * @return
	 */
	@RequestMapping(value = {"shopList"}, method = {RequestMethod.GET})
	public String shopList() {
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
			logger.debug(ex.getMessage());
		}
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
			if(shopService.deleteShop(shopId)>0){
				resultInfo.setCode(ResultEnum.SUCCESS.getCode());
		        resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
			}else{
				resultInfo.setCode(ResultEnum.FAILED.getCode());
		        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			}
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.FAILED.getCode());
	        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
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
			if(shopService.updateShopStatus(shop)>0){
				resultInfo.setCode(ResultEnum.SUCCESS.getCode());
		        resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
			}else{
				resultInfo.setCode(ResultEnum.FAILED.getCode());
		        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
			}
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.FAILED.getCode());
	        resultInfo.setInfo(ResultEnum.FAILED.getInfo());
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
			logger.error(ex.getMessage());
		}
		model.addAttribute("shop", shop);
		model.addAttribute("shopcheck", shopCheck);
		return "shop/shop_detail";		
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
			logger.debug(ex.getMessage());
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
	 * 商户账户管理
	 * @return
	 */
	@RequestMapping(value = {"shopAccount"}, method = {RequestMethod.GET})
	public String shopAccount() {
		return "shop/shop_account";		
	}
	
	///////////////////以下调试///////////////////////
	
	
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
			/*if(shop.getAccountbank()==null||"".equals(shop.getAccountbank())){
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
			}*/
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

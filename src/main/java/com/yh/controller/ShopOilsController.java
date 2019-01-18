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
import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.alibaba.fastjson.JSON;
import com.yh.common.Common;
import com.yh.model.DicPublicKey;
import com.yh.model.ShopOils;
import com.yh.model.SysUser;
import com.yh.service.DicPublicKeyService;
import com.yh.service.ShopOilsService;
import com.yh.service.ShopService;
import com.yh.service.SysUserService;

@Controller
@RequestMapping({"/shopOils"})
public class ShopOilsController {
	private static final Log logger = LogFactory.getLog(ShopController.class);
	@Resource
	private ShopOilsService shopOilsService;
	@Resource
	private SysUserService sysUserService;
	@Resource
	private ShopService shopService;
	@Resource
	private DicPublicKeyService dicPublicKeyService;
	/**
	 * 油价定义列表页面
	 * @return
	 */
	@RequestMapping(value = {"shopOilsList"}, method = {RequestMethod.GET})
	public String shopOilsList() {
		logger.info("油价定义列表");		
		return "shopoils/shopoils_list";
	}
	/**
	 * 产品(油品)查询
	 * @param shopOils
	 * @return
	 */
	@RequestMapping(value = {"shopOilsSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<ShopOils> shopOilsSearch(@RequestBody ShopOils shopOils) {
		List<ShopOils> shopOilsList = new ArrayList<ShopOils>();
		int userRoleType= this.getUserRoleType();
		System.out.println( "SHOPID:>"+Common.getCurrentUserShopId());
		try{
			if(userRoleType==1){//商家
				shopOils.setShopid(Common.getCurrentUserShopId());
			}else if(userRoleType==2){ //运营人员或管理员
				shopOils.setShopid("");
			}else{
				//当用户角色类型为其它值时，店铺ID设置一个未能查到的商家信息；
				shopOils.setShopid(Common.createUUid()); 
			}
			shopOilsList=shopOilsService.getShopOilsList(shopOils);
		}catch(Exception ex){
			logger.info(ex.getMessage());
			System.out.println("xy>:"+ex.getMessage());
		}
        return shopOilsList;
	}
	/**
	 * 添加产品(油品)
	 * @return
	 */	 
	@RequestMapping(value = {"addShopOils"}, method = {RequestMethod.GET})
	public String addShopOils() {
		return "shopoils/shopoils_add";
	}
	/**
	 * 编辑产品(油品)
	 * @param shopOilsId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"editShopOils/{shopoilsid}"}, method = {RequestMethod.GET})
	public String editShopOils(@PathVariable(name ="shopoilsid") String shopOilsId, Model model) {
		if(shopOilsId.trim().length()<=0) return "";
		ShopOils shopOils = new ShopOils();
		shopOils=shopOilsService.getShopOilsById(shopOilsId); 		
		model.addAttribute("shopoils", shopOils); 
		return "shopoils/shopoils_add";
	}
	/**
	 * 删除产品(油品)
	 * @param shopOilsId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"deleteShopOils/{shopoilsid}"}, method = {RequestMethod.POST})
	public @ResponseBody Object deleteShopOils(@PathVariable(name ="shopoilsid") String shopOilsId, Model model) {
		if(shopOilsId.trim().length()<=0) return "";
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			shopOilsService.deleteShopOils(shopOilsId);
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
	 * 保存产品(油品)
	 * @param shopOils
	 * @return
	 */
	@RequestMapping(value = {"saveShopOils"}, method = {RequestMethod.POST})
	public @ResponseBody Object saveShopOils(@RequestBody ShopOils shopOils) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();	
		String codeValue = "",infoValue="";
		logger.info(JSON.toJSON(shopOils));
		try{
			//获取油价上限,不可大于上限；
			DicPublicKey dicPublicKey=dicPublicKeyService.getPublicKeyByCode("OP_MAX01");
			double keyValue=Double.parseDouble(dicPublicKey.getKeyvalue());
			if(shopOils.getSourceprice()>keyValue||shopOils.getPayprice1()>keyValue||
				shopOils.getPayprice2()>keyValue||shopOils.getPayprice3()>keyValue||
				shopOils.getPayprice4()>keyValue||shopOils.getPayprice5()>keyValue||
				shopOils.getPayprice6()>keyValue||shopOils.getPayprice7()>keyValue||keyValue<=0){
				resultInfo.setCode(ResultEnum.ERROR_KEY.getCode());
		        resultInfo.setInfo(ResultEnum.ERROR_KEY.getInfo());
		        return resultInfo;
			}
			if(shopOils.getShopoilsid()!=null && !"".equals(shopOils.getShopoilsid())){
				shopOilsService.updateShopOilsById(shopOils);
				codeValue=ResultEnum.SUCCESS.getCode();
				infoValue=ResultEnum.SUCCESS.getInfo();
			}else{
				List<ShopOils> shopOilsList = shopOilsService.isExistsShopOils(shopOils);
				if(shopOilsList.size()==0){
					shopOils.setShopoilsid(UUID.randomUUID().toString());
					shopOils.setCreatetime(Common.GetNowDate().toString());
					shopOils.setCreatorid(Common.getSession().getAttribute("userid").toString());
					shopOils.setOrdernum(Common.getRandomIndex());
					if(shopOilsService.insertShopOils(shopOils)>0){
						codeValue=ResultEnum.SUCCESS.getCode();
						infoValue=ResultEnum.SUCCESS.getInfo();
					}else{
						codeValue=ResultEnum.FAILED.getCode();
						infoValue=ResultEnum.FAILED.getInfo();
					}
				}else if(shopOilsList.size()==1){
					codeValue=ResultEnum.YES_EXISTS.getCode();
					infoValue=ResultEnum.YES_EXISTS.getInfo();
				}else{
					//异常数据，可能存在多条产品数据；
					codeValue=ResultEnum.FAILED.getCode();
					infoValue=ResultEnum.FAILED.getInfo();
				}		
			}		
			resultInfo.setCode(codeValue);
	        resultInfo.setInfo(infoValue);
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
		return resultInfo;
	}
	/**
	 * 获取用户角色，商家或运营人员或管理员；
	 * @return 0：异常1：商家2：运营人员或管理员
	 */
	public int getUserRoleType(){
		int roleType=0;
		try{
			String logincode=Common.getSession().getAttribute("logincode").toString();			
			SysUser user=sysUserService.getSysUserByCode(logincode);
			if("1".equals(user.getUsertype()) && user.getShopid().length()>0){
				//0:无1:商家2:运营人员3:管理员
				roleType=1;
			}else if("2".equals(user.getUsertype())||"3".equals(user.getUsertype())){
				//运营人员或管理员
				roleType=2;
			}else{
				roleType=0;
			}
		}catch (Exception e) {
			roleType=0;
			logger.info(e.getMessage());
			System.out.println("异常："+e.getMessage());
		}
		return roleType;
	}
}

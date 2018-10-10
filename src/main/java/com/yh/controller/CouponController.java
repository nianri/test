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
import com.yh.common.Common;
import com.yh.model.CouponInfo;
import com.yh.model.SysUser;
import com.yh.service.CouponService;
import com.yh.service.ShopService;
import com.yh.service.SysUserService;

@Controller
@RequestMapping({"/coupon"})
public class CouponController {
	private static final Log logger = LogFactory.getLog(ShopController.class);
	@Resource
	private CouponService couponService;
	@Resource
	private SysUserService sysUserService;
	@Resource
	private ShopService shopService;
	/**
	 * 优惠券定义列表
	 * @return
	 */
	@RequestMapping(value = {"couponList"}, method = {RequestMethod.GET})
	public String shopOilsList() {
		logger.info("优惠券定义列表");		
		return "coupon/coupon_list";
	}
	/**
	 * 优惠券查询
	 * @param 
	 * @return
	 */
	@RequestMapping(value = {"couponSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<CouponInfo> couponSearch(@RequestBody CouponInfo cuponInfo) {
		List<CouponInfo> couponInfoList = new ArrayList<CouponInfo>();
		int userRoleType= this.getUserRoleType();
		System.out.println(userRoleType);
		try{
			if(userRoleType==1){//商家
				cuponInfo.setShopid(Common.getCurrentUserShopId());
			}else if(userRoleType==2){ //运营人员或管理员
				cuponInfo.setShopid("");
			}else{
				//当用户角色类型为其它值时，加油站ID设置一个未能查到的产品信息；
				cuponInfo.setShopid("XX100YY");
				logger.info("优惠券获取加油站ID为空！");
			}
			couponInfoList=couponService.getCouponList(cuponInfo);
		}catch(Exception ex){
			logger.info(ex.getMessage());
			System.out.println("xy>:"+ex.getMessage());
		}
        return couponInfoList;
	}
	/**
	 * 打开-添加优惠券页面
	 * @return
	 */	 
	@RequestMapping(value = {"addCoupon"}, method = {RequestMethod.GET})
	public String addCoupon() {
		return "coupon/coupon_add";
	}
	/**
	 * 编辑优惠券
	 * @param couponId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"editCoupon/{couponid}"}, method = {RequestMethod.GET})
	public String editCoupon(@PathVariable(name ="couponid") String couponId, Model model) {
		if(couponId.trim().length()<=0) return "";
		CouponInfo couponInfo = new CouponInfo();
		couponInfo=couponService.getCouponById(couponId); 		
		model.addAttribute("coupon", couponInfo); 
		return "coupon/coupon_add";
	}
	/**
	 * 删除优惠券
	 * @param couponId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"deleteCoupon/{couponid}"}, method = {RequestMethod.POST})
	public @ResponseBody Object deleteShopOils(@PathVariable(name ="couponid") String couponId, Model model) {
		if(couponId.trim().length()<=0) return "";
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			couponService.deleteCoupon(couponId);
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
	 * 保存优惠券
	 * @param shopOils
	 * @return
	 */
	@RequestMapping(value = {"saveCoupon"}, method = {RequestMethod.POST})
	public @ResponseBody Object saveCoupon(@RequestBody CouponInfo couponInfo) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();			 
		try{
			if(couponInfo.getCouponid()!=null && !"".equals(couponInfo.getCouponid())){
				couponService.updateCouponById(couponInfo);				 
			}else{
				couponInfo.setCouponid(UUID.randomUUID().toString());
				couponInfo.setCreatetime(Common.GetNowDate().toString());
				couponInfo.setCreatorid(Common.getSession().getAttribute("userid").toString());
				if(couponInfo.getShopid().length()>0) 
					couponInfo.setCoupontype("1");//设置为商户券；
				else
					couponInfo.setCoupontype("2");//设置为系统券；
				couponService.insertCoupon(couponInfo); 				 			
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
	/**
	 * 获取用户角色，商家或运营人员或管理员；
	 * @return 0：异常1：商家2：运营人员或管理员
	 */
	public int getUserRoleType(){
		int roleType=0;
		try{
			String logincode=Common.getSession().getAttribute("logincode").toString();			
			SysUser user=sysUserService.getSysUserByCode(logincode);
			if( "1".equals(user.getUsertype()) && user.getShopid().length()>0){
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

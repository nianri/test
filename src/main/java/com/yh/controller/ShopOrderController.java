package com.yh.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.yh.common.common;
import com.yh.model.ShopOrder;
import com.yh.model.SysUser;
import com.yh.service.ShopOrderService;
import com.yh.service.SysUserService;

@Controller
@RequestMapping({"/shopOrder"})
public class ShopOrderController {
	private static final Log logger = LogFactory.getLog(ShopController.class);
	@Resource 
	ShopOrderService shopOrderService;
	@Resource 
	SysUserService sysUserService;
	/**
	 * 打开订单列表
	 * @return
	 */
	@RequestMapping(value = {"shopOrderList"}, method = {RequestMethod.GET})
	public String shopOrderList() {
		logger.info("订单列表");		
		return "shoporder/shoporder_list";
	}
	/**
	 * 订单列表查询
	 * @param shopOrder
	 * @return
	 */
	@RequestMapping(value = {"shopOrderSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<ShopOrder> shopOrderSearch(@RequestBody ShopOrder shopOrder) {
		List<ShopOrder> shopOrderList = new ArrayList<ShopOrder>();
		int userRoleType= this.getUserRoleType();
		System.out.println(userRoleType);
		try{
			if(userRoleType==1){//商家
				shopOrder.setShopid(common.getCurrentUserShopId());
			}else if(userRoleType==2){ //运营人员或管理员
				shopOrder.setShopid("");
			}else{
				//当用户角色类型为其它值时，店铺ID设置一个未能查到的产品信息；
				shopOrder.setShopid("XX100YY");
				logger.info("产品获取店铺ID为空！");
			}
			if(shopOrder.getBegintime().trim().length()>0){
				shopOrder.setBegintime(shopOrder.getBegintime()+" 00:00:00");
			}
			if(shopOrder.getEndtime().trim().length()>0){
				shopOrder.setEndtime(shopOrder.getEndtime()+" 23:59:59");
			}
			shopOrderList=shopOrderService.getShopOrderList(shopOrder);
		}catch(Exception ex){
			logger.info(ex.getMessage());
			System.out.println("xy>:"+ex.getMessage());
		}
        return shopOrderList;
	}
	/**
	 * 订单详情
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"shopOrderDetail/{orderid}"}, method = {RequestMethod.GET})
	public String shopOrderDetail(@PathVariable(name ="orderid") String orderId, Model model) {
		ShopOrder shopOrder = new ShopOrder();
		try{
			shopOrder=shopOrderService.getShopOrderById(orderId);
			if(shopOrder!=null){
				switch (shopOrder.getPaytype()){
					case "1":
						shopOrder.setPaytype("微信");
						break;
					case "2":
						shopOrder.setPaytype("微信");
						break;
					case "3":
						shopOrder.setPaytype("刷卡");
						break;
					default:
						shopOrder.setPaytype("未知");
						break;
				}
				switch (shopOrder.getStatus()){
					case "1":
						shopOrder.setStatus("待支付");
						break;
					case "2":
						shopOrder.setStatus("已支付");
						break;
					case "3":
						shopOrder.setStatus("加油完成");
						break;
					case "4":
						shopOrder.setStatus("申请退款");
						break;
					case "5":
						shopOrder.setStatus("退款成功");
						break;
					default:
						shopOrder.setStatus("未知");
						break;
				}
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		model.addAttribute("shoporder", shopOrder);
		return "shoporder/shoporder_detail";		
	}
	
	@RequestMapping(value = {"memberShopOrderList/{memberid}"}, method = {RequestMethod.GET})
	public String memberShopOrderList(@PathVariable(name ="memberid") String memberId,Model model) {
		logger.info("会员订单列表");
		model.addAttribute("memberid",memberId);
		return "shoporder/memberorder_list";
	}
	/*@RequestMapping(value = {"getMemberShopOrder/{memberid}"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody Object getShopOrderByMemberId(@PathVariable(name ="memberid") String memberId, Model model) {
		List<ShopOrder> shopOrderList = new ArrayList<ShopOrder>();		
		try{
			shopOrderList=shopOrderService.getShopOrderByMemberId(memberId);
		}catch(Exception ex){
			logger.info(ex.getMessage());
		}
		model.addAttribute("shopOrderList",shopOrderList);
        return "shoporder/membershoporder";
	}*/
	
	/**
	 * 获取用户角色，商家或运营人员或管理员；
	 * @return 0：异常1：商家2：运营人员或管理员
	 */
	public int getUserRoleType(){
		int roleType=0;
		try{
			String logincode=common.getSession().getAttribute("logincode").toString();			
			SysUser user=sysUserService.getSysUserByCode(logincode);
			if("1".equals(user.getUsertype()) && user.getShopid().length()>0){
				//商家 0:无1:运营人员2:管理员
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

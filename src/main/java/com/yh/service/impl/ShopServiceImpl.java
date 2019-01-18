package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yh.common.Common;
import com.yh.dao.ShopCheckMapper;
import com.yh.dao.ShopMapper;
import com.yh.model.Shop;
import com.yh.model.ShopCheck;
import com.yh.service.ShopService;

@Service("ShopService") 
public class ShopServiceImpl implements ShopService{
	@Resource  
	private ShopMapper shopMapper;
	@Resource  
	private ShopCheckMapper shopCheckMapper;
	
	public int insertShop(Shop shop){
		return shopMapper.insertShop(shop);
	}
	public int updateShopById(Shop shop){
		return shopMapper.updateShopById(shop);
	}
	public List<Shop> getShopAddList(Shop shop){
		return shopMapper.getShopAddList(shop);		 
	}
	public List<Shop> getShopList(Shop shop){
		return shopMapper.getShopList(shop);		 
	}
	public int updateShopStatus(Shop shop){
		return shopMapper.updateShopStatus(shop);		 
	}
	public int deleteShop(String shopid){		
		return shopMapper.deleteShop(shopid);
	}
	public List<Shop> getShopCheckList(Shop shop){
		return shopMapper.getShopCheckList(shop);
	}
	public Shop getShopById(String shopid){
		return shopMapper.getShopById(shopid);
	}
	public List<Shop> getShopByRight(){
		return shopMapper.getShopByRight();
	}
	public int submitShopSetting(Shop shop){
		return shopMapper.submitShopSetting(shop);
	}
	@Transactional 
	public int commitShopToCheck(Shop shop){
		int rtnRow=0;			
		try{	
			ShopCheck shopCheck = new ShopCheck();
			shopCheck.setShopid(shop.getShopid());
			shopCheck.setScheckid(Common.createUUid());
			shopCheck.setSubmittime(Common.GetNowDate());
			shopCheck.setStatus("0");//待审核
			shopCheck.setSubmitterid(Common.getSession().getAttribute("userid").toString());
			shop.setStatus("1");//待审核
			rtnRow=shopMapper.updateShopStatus(shop);
			rtnRow+=shopCheckMapper.insertShopCheck(shopCheck);			
		}catch(Exception ex){			
			System.out.println(ex.getMessage());
			rtnRow=0;
		}
		return rtnRow;
	}
	@Transactional 
	public int commitCheckShop(ShopCheck shopCheck){
		int rtnRow=0;			
		try{
			Shop shop = new Shop();
			shop.setShopid(shopCheck.getShopid());
			String strStatus="1".equals(shopCheck.getStatus())?"2":"3";
			shop.setStatus(strStatus);
			rtnRow=shopMapper.updateShopStatus(shop);
			shopCheck.setChecktime(Common.GetNowDate());
			shopCheck.setAuditorid(Common.getSession().getAttribute("userid").toString());
			rtnRow+=shopCheckMapper.submitCheckShop(shopCheck);		
		}catch(Exception ex){			
			System.out.println(ex.getMessage());
			rtnRow=0;
		}
		return rtnRow;
	}
}

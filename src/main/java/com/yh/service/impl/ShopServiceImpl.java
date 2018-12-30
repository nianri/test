package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yh.dao.ShopMapper;
import com.yh.model.Shop;
import com.yh.service.ShopService;

@Service("ShopService") 
public class ShopServiceImpl implements ShopService{
	@Resource  
	private ShopMapper shopMapper;
	
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
	public int saveShopXY(Shop shop){
		return shopMapper.saveShopXY(shop);
	}
	public int submitShopSetting(Shop shop){
		return shopMapper.submitShopSetting(shop);
	}
}

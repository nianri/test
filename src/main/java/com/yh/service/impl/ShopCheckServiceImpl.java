package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.yh.dao.ShopCheckMapper;
import com.yh.dao.ShopMapper;
import com.yh.model.Shop;
import com.yh.model.ShopCheck;
import com.yh.service.ShopCheckService;

@Service("ShopCheckService") 
public class ShopCheckServiceImpl implements ShopCheckService {
	@Resource  
	private ShopCheckMapper shopCheckMapper;
	@Resource  
	private ShopMapper shopMapper;
		 
	public int insert(ShopCheck shopCheck){
		return shopCheckMapper.insert(shopCheck);
	}
	public int insertSelective(ShopCheck shopCheck){
		return shopCheckMapper.insertSelective(shopCheck);
	}
	public ShopCheck getShopCheckInfo(String shopId){
		return shopCheckMapper.getShopCheckInfo(shopId);
	}
	@Transactional //(rollbackFor=Exception.class)
	public int submitShopCheck(ShopCheck shopCheck){
		int rtnRow=0;	 
		Shop shop =new Shop();
		shop.setShopid(shopCheck.getShopid());
		shop.setLatitude(shopCheck.getLatitude());
		shop.setLongitude(shopCheck.getLongitude());
		//未通过
		if(shopCheck.getStatus().equals("1")){
			shop.setStatus("2");//未通过			
		}else if(shopCheck.getStatus().equals("2")){
			shop.setStatus("3");//通过
		}else{
			shop.setStatus("1");//未通过
		}		
		try{			
			rtnRow=shopMapper.updateShopStatus(shop);
			rtnRow+=shopCheckMapper.submitShopCheck(shopCheck);			
		}catch(Exception ex){			
			System.out.println(ex.getMessage());
			rtnRow=0;
		}
		System.out.println("ROWS:>"+rtnRow);
		return rtnRow;
	}
	public List<ShopCheck> getShopCheckLog(@Param("shopid") String shopid){
		return shopCheckMapper.getShopCheckLog(shopid);
	}
}

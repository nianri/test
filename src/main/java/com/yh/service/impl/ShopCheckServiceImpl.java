package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.yh.dao.ShopCheckMapper;
import com.yh.model.ShopCheck;
import com.yh.service.ShopCheckService;

@Service("ShopCheckService") 
public class ShopCheckServiceImpl implements ShopCheckService {
	@Resource  
	private ShopCheckMapper shopCheckMapper;
	 
	public int insertShopCheck(ShopCheck shopCheck){
		return shopCheckMapper.insertShopCheck(shopCheck);
	}
	public ShopCheck getShopCheckInfo(String shopId){
		return shopCheckMapper.getShopCheckInfo(shopId);
	}
	public List<ShopCheck> getShopCheckLog(@Param("shopid") String shopid){
		return shopCheckMapper.getShopCheckLog(shopid);
	}
}

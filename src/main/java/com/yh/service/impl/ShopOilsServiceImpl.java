package com.yh.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.yh.dao.OilsLogMapper;
import com.yh.dao.ShopOilsMapper;
import com.yh.model.OilsLog;
import com.yh.model.ShopOils;
import com.yh.service.ShopOilsService;

@Service("ShopOilsService") 
public class ShopOilsServiceImpl implements ShopOilsService{
	@Resource  
	private ShopOilsMapper shopOilsMapper;
	@Resource  
	private OilsLogMapper oilsLogMapper;
	@Transactional
	public int insertShopOils(ShopOils shopOils){
		int rows=0;
    	OilsLog oilsLog = new OilsLog();
    	oilsLog.setSoilslogid(UUID.randomUUID().toString());
    	oilsLog.setShopid(shopOils.getShopid());
    	oilsLog.setOilsid(shopOils.getOilsid());
    	oilsLog.setSourceprice(shopOils.getSourceprice());
    	oilsLog.setPayprice1(shopOils.getPayprice1());
    	oilsLog.setPayprice2(shopOils.getPayprice2());
    	oilsLog.setPayprice3(shopOils.getPayprice3());
    	oilsLog.setPayprice4(shopOils.getPayprice4());
    	oilsLog.setPayprice5(shopOils.getPayprice5());
    	oilsLog.setPayprice6(shopOils.getPayprice6());
    	oilsLog.setPayprice7(shopOils.getPayprice7());
    	oilsLog.setRuntime(shopOils.getRuntime());
    	oilsLog.setOrdernum(shopOils.getOrdernum());
    	oilsLog.setStatus(shopOils.getStatus());
    	oilsLog.setCreatetime(shopOils.getCreatetime());
    	rows=shopOilsMapper.insertShopOils(shopOils);
    	rows+=oilsLogMapper.insertOilsLog(oilsLog);    	
		return rows;
	}
	public List<ShopOils> getShopOilsList(ShopOils shopOils){
		return shopOilsMapper.getShopOilsList(shopOils);
	}
    public ShopOils getShopOilsById(@Param("shopoilsid") String shopoilsid){
    	return shopOilsMapper.getShopOilsById(shopoilsid);
    }
    public int deleteShopOils(@Param("shopoilsid") String shopoilsid){
    	return shopOilsMapper.deleteShopOils(shopoilsid);
    }
    @Transactional
    public int updateShopOilsById(ShopOils shopOils){
    	int rows=0;
    	Date dt = new Date(); 
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    
    	OilsLog oilsLog = new OilsLog();
    	oilsLog.setSoilslogid(UUID.randomUUID().toString());
    	oilsLog.setShopid(shopOils.getShopid());
    	oilsLog.setOilsid(shopOils.getOilsid());
    	oilsLog.setSourceprice(shopOils.getSourceprice());
    	oilsLog.setPayprice1(shopOils.getPayprice1());
    	oilsLog.setPayprice2(shopOils.getPayprice2());
    	oilsLog.setPayprice3(shopOils.getPayprice3());
    	oilsLog.setPayprice4(shopOils.getPayprice4());
    	oilsLog.setPayprice5(shopOils.getPayprice5());
    	oilsLog.setPayprice6(shopOils.getPayprice6());
    	oilsLog.setPayprice7(shopOils.getPayprice7());
    	oilsLog.setRuntime(shopOils.getRuntime());
    	oilsLog.setOrdernum(shopOils.getOrdernum());
    	oilsLog.setStatus(shopOils.getStatus()); 
    	oilsLog.setCreatetime(sdf.format(dt));
    	rows=shopOilsMapper.updateShopOilsById(shopOils);    	
    	rows+=oilsLogMapper.insertOilsLog(oilsLog);
    	return rows;
    }
    public List<ShopOils> isExistsShopOils(ShopOils shopOils){
    	return shopOilsMapper.isExistsShopOils(shopOils);
    }
}

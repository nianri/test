package com.yh.service;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yh.model.ShopOils;

public interface ShopOilsService {
	public int insertShopOils(ShopOils shopOils);
	public List<ShopOils> getShopOilsList(ShopOils shopOils);	
    public ShopOils getShopOilsById(@Param("shopoilsid") String shopoilsid);
    public int deleteShopOils(@Param("shopoilsid") String shopoilsid);
    public int updateShopOilsById(ShopOils shopOils);
    public List<ShopOils> isExistsShopOils(ShopOils shopOils);
}

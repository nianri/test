package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yh.dao.CouponInfoMapper;
import com.yh.model.CouponInfo;
import com.yh.service.CouponService;

@Service("CouponService") 
public class CouponServiceImpl implements CouponService{
	@Resource  
	private CouponInfoMapper couponInfoMapper;
	
	public int insertCoupon(CouponInfo couponInfo){		
		return couponInfoMapper.insertCoupon(couponInfo);		  
	}
	public List<CouponInfo> getCouponList(CouponInfo couponInfo){
		return couponInfoMapper.getCouponList(couponInfo);
	}
    public CouponInfo getCouponById(String couponId){
    	return couponInfoMapper.getCouponById(couponId);
    }
    public int deleteCoupon(String couponId){
    	return couponInfoMapper.deleteCoupon(couponId);
    }
    public int couponUp(String couponId){
    	return couponInfoMapper.couponUp(couponId);
    }
    public int couponDown(String couponId){
    	return couponInfoMapper.couponDown(couponId);
    }
    public int updateCouponById(CouponInfo couponInfo){ 
    	return couponInfoMapper.updateCouponById(couponInfo);     	  
    }
}

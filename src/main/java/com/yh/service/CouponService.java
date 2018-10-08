package com.yh.service;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.yh.model.CouponInfo;

public interface CouponService {
	public int insertCoupon(CouponInfo couponInfo);
	public List<CouponInfo> getCouponList(CouponInfo couponInfo);	
    public CouponInfo getCouponById(@Param("couponid") String couponId);
    public int deleteCoupon(@Param("couponid") String couponId);
    public int updateCouponById(CouponInfo couponInfo);
}

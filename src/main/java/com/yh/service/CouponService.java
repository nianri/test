package com.yh.service;

import java.util.List;
import com.yh.model.CouponInfo;

public interface CouponService {
	public int insertCoupon(CouponInfo couponInfo);
	public List<CouponInfo> getCouponList(CouponInfo couponInfo);	
    public CouponInfo getCouponById(String couponId);
    public int deleteCoupon(String couponId);
    public int couponUp(String couponId);
    public int couponDown(String couponId);
    public int updateCouponById(CouponInfo couponInfo);
}

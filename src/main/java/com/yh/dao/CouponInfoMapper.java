package com.yh.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yh.model.CouponInfo;

public interface CouponInfoMapper {
	public int insertCoupon(CouponInfo record);
    public List<CouponInfo> getCouponList(CouponInfo couponInfo);
    public CouponInfo getCouponById(@Param("couponid") String couponId);
    public int deleteCoupon(@Param("couponid") String couponId);
    public int couponUp(@Param("couponid") String couponId);
    public int couponDown(@Param("couponid") String couponId);
    public int updateCouponById(CouponInfo couponInfo);
}
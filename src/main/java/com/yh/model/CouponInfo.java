package com.yh.model;

import java.io.Serializable;

import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "coupon_info")
public class CouponInfo implements Serializable{
	private static final long serialVersionUID = 1L;
    private String couponid;

    private Integer couponcode;

    private String couponname;
    
    private String coupondesc;
    
    private String begintime;

    private String endtime;

    private String coupontype;

    private Double couponprice;
    private Integer totalnums;
    private Integer couponnums;

    private Double fullamount;

    private String shopid;

    private String createtime;

    private String creatorid;

    private String status;

    private String memo;
    @Transient
    private String shopname;
    
    public Integer getTotalnums() {
		return totalnums;
	}

	public void setTotalnums(Integer totalnums) {
		this.totalnums = totalnums;
	}

	public String getCouponid() {
        return couponid;
    }

    public void setCouponid(String couponid) {
        this.couponid = couponid == null ? null : couponid.trim();
    }

    public Integer getCouponcode() {
        return couponcode;
    }

    public void setCouponcode(Integer couponcode) {
        this.couponcode = couponcode;
    }

    public String getCouponname() {
        return couponname;
    }

    public void setCouponname(String couponname) {
        this.couponname = couponname == null ? null : couponname.trim();
    }

    public String getBegintime() {
        return begintime;
    }

    public void setBegintime(String begintime) {
        this.begintime = begintime == null ? null : begintime.trim();
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime == null ? null : endtime.trim();
    }

    public String getCoupontype() {
        return coupontype;
    }

    public void setCoupontype(String coupontype) {
        this.coupontype = coupontype == null ? null : coupontype.trim();
    }

    

    public Double getCouponprice() {
		return couponprice;
	}

	public void setCouponprice(Double couponprice) {
		this.couponprice = couponprice;
	}

	public Integer getCouponnums() {
        return couponnums;
    }

    public void setCouponnums(Integer couponnums) {
        this.couponnums = couponnums;
    }

    public Double getFullamount() {
        return fullamount;
    }

    public void setFullamount(Double fullamount) {
        this.fullamount = fullamount;
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid == null ? null : shopid.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(String creatorid) {
        this.creatorid = creatorid == null ? null : creatorid.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getCoupondesc() {
		return coupondesc;
	}

	public void setCoupondesc(String coupondesc) {
		this.coupondesc = coupondesc;
	}
    
}
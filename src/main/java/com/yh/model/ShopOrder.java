package com.yh.model;

import java.io.Serializable;

import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "shop_order")
public class ShopOrder implements Serializable{
	private static final long serialVersionUID = 1L;
    private String orderid;

    private Integer ordercode;

    private String shopid;
    private String oilsid;
    private String memberid;

    private String ordertime;

    private Double totalprice;

    private Double couponprice;

    private Double realprice;

    private String couponmemberid;

    private String orderdesc;

    private String paytype;

    private String paytime;

    private String paycode;

    private String status;
    private String integral;
    private String memo;
    @Transient
    private String shopname;
    @Transient
    private String memberdesc;
    @Transient
    private String begintime;
    @Transient
    private String endtime;
    @Transient
    private String oilsname;
    
    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    public Integer getOrdercode() {
        return ordercode;
    }

    public void setOrdercode(Integer ordercode) {
        this.ordercode = ordercode;
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid == null ? null : shopid.trim();
    }
    
    public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime == null ? null : ordertime.trim();
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public Double getCouponprice() {
        return couponprice;
    }

    public void setCouponprice(Double couponprice) {
        this.couponprice = couponprice;
    }

    public Double getRealprice() {
        return realprice;
    }

    public void setRealprice(Double realprice) {
        this.realprice = realprice;
    }

    

    public String getCouponmemberid() {
		return couponmemberid;
	}

	public void setCouponmemberid(String couponmemberid) {
		this.couponmemberid = couponmemberid;
	}

	public String getOrderdesc() {
        return orderdesc;
    }

    public void setOrderdesc(String orderdesc) {
        this.orderdesc = orderdesc == null ? null : orderdesc.trim();
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype == null ? null : paytype.trim();
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime == null ? null : paytime.trim();
    }

    public String getPaycode() {
        return paycode;
    }

    public void setPaycode(String paycode) {
        this.paycode = paycode == null ? null : paycode.trim();
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

	 

	public String getMemberdesc() {
		return memberdesc;
	}

	public void setMemberdesc(String memberdesc) {
		this.memberdesc = memberdesc;
	}

	public String getIntegral() {
		return integral;
	}

	public void setIntegral(String integral) {
		this.integral = integral;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getOilsid() {
		return oilsid;
	}

	public void setOilsid(String oilsid) {
		this.oilsid = oilsid;
	}

	public String getOilsname() {
		return oilsname;
	}

	public void setOilsname(String oilsname) {
		this.oilsname = oilsname;
	}
    
}
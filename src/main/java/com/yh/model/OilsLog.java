package com.yh.model;

import java.io.Serializable;

import javax.persistence.Table;

@Table(name = "shop_oilslog")
public class OilsLog implements Serializable{
	private static final long serialVersionUID = 1L;
    private String soilslogid;

    private String shopid;

    private String oilsid;

    private Double sourceprice;

    private Double couponprice;

    private Double payprice1;
    private Double payprice2;
    private Double payprice3;
    private Double payprice4;
    private Double payprice5;
    private Double payprice6;
    private Double payprice7;
    
    private String runtime;

    private String ordernum;

    private String createtime;

    private String creatorid;

    private String status;

    private String memo;

    public String getSoilslogid() {
        return soilslogid;
    }

    public void setSoilslogid(String soilslogid) {
        this.soilslogid = soilslogid == null ? null : soilslogid.trim();
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid == null ? null : shopid.trim();
    }

    public String getOilsid() {
        return oilsid;
    }

    public void setOilsid(String oilsid) {
        this.oilsid = oilsid == null ? null : oilsid.trim();
    }

    public Double getSourceprice() {
        return sourceprice;
    }

    public void setSourceprice(Double sourceprice) {
        this.sourceprice = sourceprice;
    }

    public Double getCouponprice() {
        return couponprice;
    }

    public void setCouponprice(Double couponprice) {
        this.couponprice = couponprice;
    }

    public Double getPayprice1() {
		return payprice1;
	}

	public void setPayprice1(Double payprice1) {
		this.payprice1 = payprice1;
	}

	public Double getPayprice2() {
		return payprice2;
	}

	public void setPayprice2(Double payprice2) {
		this.payprice2 = payprice2;
	}

	public Double getPayprice3() {
		return payprice3;
	}

	public void setPayprice3(Double payprice3) {
		this.payprice3 = payprice3;
	}

	public Double getPayprice4() {
		return payprice4;
	}

	public void setPayprice4(Double payprice4) {
		this.payprice4 = payprice4;
	}

	public Double getPayprice5() {
		return payprice5;
	}

	public void setPayprice5(Double payprice5) {
		this.payprice5 = payprice5;
	}

	public Double getPayprice6() {
		return payprice6;
	}

	public void setPayprice6(Double payprice6) {
		this.payprice6 = payprice6;
	}

	public Double getPayprice7() {
		return payprice7;
	}

	public void setPayprice7(Double payprice7) {
		this.payprice7 = payprice7;
	}

	public String getRuntime() {
        return runtime;
    }

    public void setRuntime(String runtime) {
        this.runtime = runtime == null ? null : runtime.trim();
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum == null ? null : ordernum.trim();
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
}
package com.yh.model;


import java.io.Serializable;
import javax.persistence.Table;

@Table( name="goods_order")
public class GoodsOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
    * 商品订单ID
    */
    private String orderid;
    /**
    * 订单号
    */
    private Integer ordercode;
    /**
    * 订单时间
    */
    private String ordertime;
    /**
    * 商品ID
    */
    private String goodsid;
    /**
    * 收货地址
    */
    private String address;
    /**
    * 收货人
    */
    private String receive;
    /**
    * 会员ID
    */
    private String memberid;
    /**
    * 电话
    */
    private String telphone;
    /**
    * 积分
    */
    private Integer integral;
    /**
    * 状态 0:待发货1:已发货2:已收货
    */
    private String status;
    /**
    * 备注
    */
    private String memo;
    /**
    * 快递公司ID
    */
    private String expressid;
    /**
    * 快递单号
    */
    private String expressnums;
    // 商品名称
    private String goodsname;
    // 价格
    private String price;

    // 商品图片
    private String goodsimg;
    
    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Integer getOrdercode() {
        return ordercode;
    }

    public void setOrdercode(Integer ordercode) {
        this.ordercode = ordercode;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public String getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(String goodsid) {
        this.goodsid = goodsid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceive() {
        return receive;
    }

    public void setReceive(String receive) {
        this.receive = receive;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public Integer getIntegral() {
        return integral;
    }

    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getExpressid() {
        return expressid;
    }

    public void setExpressid(String expressid) {
        this.expressid = expressid;
    }

    public String getExpressnums() {
        return expressnums;
    }

    public void setExpressnums(String expressnums) {
        this.expressnums = expressnums;
    }

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getGoodsimg() {
		return goodsimg;
	}

	public void setGoodsimg(String goodsimg) {
		this.goodsimg = goodsimg;
	}


}

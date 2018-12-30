package com.yh.model;


import java.io.Serializable;
import javax.persistence.Table;

public class ShopOrderReport implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String shopid;
    // 加油站名称
    private String shopname;
    // 待支付订单数
	private String topay;
	// 已支付订单数
	private String paid;
	// 加油完成订单数
	private String complete;
	// 申请退款订单数
	private String applyRefund;
	// 退款成功订单数
	private String refundSuccess;
	// 总订单数
	private String total;
	// 应付总金额
	private String totalprice;
	// 优惠总金额
	private String couponprice; 
	// 实付总金额
	private String realprice;
	// 订单状态查询用,前置查询时间
	private String dateFrom;
	// 订单状态查询用,后置查询时间
	private String dateTo;
	// 订单查询年
	private String orderYear;
	public String getShopid() {
		return shopid;
	}
	public void setShopid(String shopid) {
		this.shopid = shopid;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getTopay() {
		return topay;
	}
	public void setTopay(String topay) {
		this.topay = topay;
	}
	public String getPaid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	public String getApplyRefund() {
		return applyRefund;
	}
	public void setApplyRefund(String applyRefund) {
		this.applyRefund = applyRefund;
	}
	public String getRefundSuccess() {
		return refundSuccess;
	}
	public void setRefundSuccess(String refundSuccess) {
		this.refundSuccess = refundSuccess;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getCouponprice() {
		return couponprice;
	}
	public void setCouponprice(String couponprice) {
		this.couponprice = couponprice;
	}
	public String getRealprice() {
		return realprice;
	}
	public void setRealprice(String realprice) {
		this.realprice = realprice;
	}
	public String getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}
	public String getDateTo() {
		return dateTo;
	}
	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}
	public String getOrderYear() {
		return orderYear;
	}
	public void setOrderYear(String orderYear) {
		this.orderYear = orderYear;
	}
	


}

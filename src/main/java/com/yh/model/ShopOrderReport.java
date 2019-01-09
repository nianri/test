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
	private String count;
	private String count1;
	private String count2;
	private String count3;
	private String count4;
	private String count5;
	private String count6;
	private String count7;
	private String count8;
	private String count9;
	private String count10;
	private String count11;
	private String count12;
	private String realprice1;
	private String realprice2;
	private String realprice3;
	private String realprice4;
	private String realprice5;
	private String realprice6;
	private String realprice7;
	private String realprice8;
	private String realprice9;
	private String realprice10;
	private String realprice11;
	private String realprice12;
	private String countC0;
	private String countC10;
	private String countC20;
	private String count92;
	private String count95;
	private String count98;
	private String realpriceC0;
	private String realpriceC10;
	private String realpriceC20;
	private String realprice92;
	private String realprice95;
	private String realprice98;
	// 是哪个页面在导出的时候用,status为订单状态 oils为产品 month为月收入报表
	private String page; 
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
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getCount1() {
		return count1;
	}
	public void setCount1(String count1) {
		this.count1 = count1;
	}
	public String getCount2() {
		return count2;
	}
	public void setCount2(String count2) {
		this.count2 = count2;
	}
	public String getCount3() {
		return count3;
	}
	public void setCount3(String count3) {
		this.count3 = count3;
	}
	public String getCount4() {
		return count4;
	}
	public void setCount4(String count4) {
		this.count4 = count4;
	}
	public String getCount5() {
		return count5;
	}
	public void setCount5(String count5) {
		this.count5 = count5;
	}
	public String getCount6() {
		return count6;
	}
	public void setCount6(String count6) {
		this.count6 = count6;
	}
	public String getCount7() {
		return count7;
	}
	public void setCount7(String count7) {
		this.count7 = count7;
	}
	public String getCount8() {
		return count8;
	}
	public void setCount8(String count8) {
		this.count8 = count8;
	}
	public String getCount9() {
		return count9;
	}
	public void setCount9(String count9) {
		this.count9 = count9;
	}
	public String getCount10() {
		return count10;
	}
	public void setCount10(String count10) {
		this.count10 = count10;
	}
	public String getCount11() {
		return count11;
	}
	public void setCount11(String count11) {
		this.count11 = count11;
	}
	public String getCount12() {
		return count12;
	}
	public void setCount12(String count12) {
		this.count12 = count12;
	}
	public String getRealprice1() {
		return realprice1;
	}
	public void setRealprice1(String realprice1) {
		this.realprice1 = realprice1;
	}
	public String getRealprice2() {
		return realprice2;
	}
	public void setRealprice2(String realprice2) {
		this.realprice2 = realprice2;
	}
	public String getRealprice3() {
		return realprice3;
	}
	public void setRealprice3(String realprice3) {
		this.realprice3 = realprice3;
	}
	public String getRealprice4() {
		return realprice4;
	}
	public void setRealprice4(String realprice4) {
		this.realprice4 = realprice4;
	}
	public String getRealprice5() {
		return realprice5;
	}
	public void setRealprice5(String realprice5) {
		this.realprice5 = realprice5;
	}
	public String getRealprice6() {
		return realprice6;
	}
	public void setRealprice6(String realprice6) {
		this.realprice6 = realprice6;
	}
	public String getRealprice7() {
		return realprice7;
	}
	public void setRealprice7(String realprice7) {
		this.realprice7 = realprice7;
	}
	public String getRealprice8() {
		return realprice8;
	}
	public void setRealprice8(String realprice8) {
		this.realprice8 = realprice8;
	}
	public String getRealprice9() {
		return realprice9;
	}
	public void setRealprice9(String realprice9) {
		this.realprice9 = realprice9;
	}
	public String getRealprice10() {
		return realprice10;
	}
	public void setRealprice10(String realprice10) {
		this.realprice10 = realprice10;
	}
	public String getRealprice11() {
		return realprice11;
	}
	public void setRealprice11(String realprice11) {
		this.realprice11 = realprice11;
	}
	public String getRealprice12() {
		return realprice12;
	}
	public void setRealprice12(String realprice12) {
		this.realprice12 = realprice12;
	}
	public String getCountC0() {
		return countC0;
	}
	public void setCountC0(String countC0) {
		this.countC0 = countC0;
	}
	public String getCountC10() {
		return countC10;
	}
	public void setCountC10(String countC10) {
		this.countC10 = countC10;
	}
	public String getCountC20() {
		return countC20;
	}
	public void setCountC20(String countC20) {
		this.countC20 = countC20;
	}
	public String getCount92() {
		return count92;
	}
	public void setCount92(String count92) {
		this.count92 = count92;
	}
	public String getCount95() {
		return count95;
	}
	public void setCount95(String count95) {
		this.count95 = count95;
	}
	public String getCount98() {
		return count98;
	}
	public void setCount98(String count98) {
		this.count98 = count98;
	}
	public String getRealpriceC0() {
		return realpriceC0;
	}
	public void setRealpriceC0(String realpriceC0) {
		this.realpriceC0 = realpriceC0;
	}
	public String getRealpriceC10() {
		return realpriceC10;
	}
	public void setRealpriceC10(String realpriceC10) {
		this.realpriceC10 = realpriceC10;
	}
	public String getRealpriceC20() {
		return realpriceC20;
	}
	public void setRealpriceC20(String realpriceC20) {
		this.realpriceC20 = realpriceC20;
	}
	public String getRealprice92() {
		return realprice92;
	}
	public void setRealprice92(String realprice92) {
		this.realprice92 = realprice92;
	}
	public String getRealprice95() {
		return realprice95;
	}
	public void setRealprice95(String realprice95) {
		this.realprice95 = realprice95;
	}
	public String getRealprice98() {
		return realprice98;
	}
	public void setRealprice98(String realprice98) {
		this.realprice98 = realprice98;
	}
	


}

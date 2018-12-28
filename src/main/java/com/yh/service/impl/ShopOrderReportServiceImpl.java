package com.yh.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.yh.dao.ShopOrderReportMapper;
import com.yh.model.ShopOrderReport;
import com.yh.service.ShopOrderReportService;

@Service("shopOrderReportService")
public class ShopOrderReportServiceImpl implements ShopOrderReportService {

	@Resource
	private ShopOrderReportMapper shopOrderReportMapper;

	@Override
	public List<ShopOrderReport> getShopOrderStatusReportList(ShopOrderReport shopOrderReport) {
		return shopOrderReportMapper.getShopOrderStatusReportList(shopOrderReport);
	}

	@Override
	public ShopOrderReport getShopOrderStatusReport(String shopid) {
		ShopOrderReport shopOrderReport=new ShopOrderReport();
		shopOrderReport.setShopid(shopid);
		List<ShopOrderReport> list = shopOrderReportMapper.getShopOrderStatusReportList(shopOrderReport);
		if(list!=null && list.size()>=1) {
			return list.get(list.size()-1);
		}
		return null;
	}

	@Override
	public List<Map<String,Object>> getShopOrderOilsReportList(ShopOrderReport shopOrderReport) {
		List<Map<String,Object>> list = shopOrderReportMapper.getShopOrderOilsReportList(shopOrderReport);

		return list;
	}

	@Override
	public Map<String,Object> getShopOrderOilsReport(String shopid) {
		ShopOrderReport shopOrderReport=new ShopOrderReport();
		shopOrderReport.setShopid(shopid);
		List<Map<String,Object>> list = shopOrderReportMapper.getShopOrderOilsReportList(shopOrderReport);
		if(list!=null && list.size()>=1) {
			return list.get(list.size()-1);
		}
		return null;
	}

	@Override
	public Map<String, Object> getShopOrderMonthReport(String shopid) {
		ShopOrderReport shopOrderReport=new ShopOrderReport();
		shopOrderReport.setShopid(shopid);
		List<Map<String,Object>> list = shopOrderReportMapper.getShopOrderOilsReportList(shopOrderReport);
		if(list!=null && list.size()>=1) {
			return list.get(list.size()-1);
		}
		return null;
	}

	@Override
	public List<Map<String, Object>> getShopOrderMonthReportList(ShopOrderReport shopOrderReport) {
		List<Map<String,Object>> list = shopOrderReportMapper.getShopOrderMonthReportList(shopOrderReport);

		return list;
	}
}

package com.yh.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.yh.service.BaseExportService;
import com.yh.service.ExportExcelService;
import com.yh.utils.ExcelExportUtil;

/**
 * excel导出
 * @author wangxu
 *
 */
@Service(value="exportExcel")
public class ExportExcelServiceImpl implements ExportExcelService, ApplicationContextAware{
	private ApplicationContext applicationContext;
	private static Logger logger=LoggerFactory.getLogger(ExportExcelServiceImpl.class);
	
	/**
	 * 导出
	 * params 结构
	 * {
	 * 	 name:'goods_info',
	 *   template:'',
	 *   isAllPage:false,
	 *   downloadtoken:''
	 *   queryParams:{
	 *   	goodscode:"",
	 *      goodsname:"",
	 *      status:[],
	 *      pagenum:1,
	 *      pagesize:10
	 *   }
	 * }
	 * @throws IOException 
	 */
	@Override
	public byte[] exportExcel(Map<String, Object> params) throws IOException {
		//bean
		String name=(String)params.get("name");
		//模板文件
		String template=(String)params.get("template");
		
		String isAllPage=(String)params.get("isAllPage");
		String queryParams=(String) params.get("queryParams");
		//导出工具
		ExcelExportUtil excelExportUtil=new ExcelExportUtil("excelTemplate/"+template);
		BaseExportService exportService=this.applicationContext.getBean(name, BaseExportService.class);
		//如果只导出一页则totalCount为pageSize
		logger.info("是否全部导出 "+isAllPage);
		if(!"true".equals(isAllPage)){
			List<?>dataList=exportService.onePageExportData(queryParams);
			excelExportUtil.init(dataList.size());
			logger.info("一页数据总量 "+dataList.size());
			excelExportUtil.fillData(dataList);
		}else{
			int totalCount=exportService.totalCount(queryParams);
			logger.info("总行数 "+totalCount);
			excelExportUtil.init(totalCount);
		    List<?> list = exportService.totalExportData(queryParams);
		    logger.info("总数据量 "+list.size());
		    excelExportUtil.fillData(list);
		}
		return excelExportUtil.exportData();
	}
	
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext=applicationContext;
	}
}

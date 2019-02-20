package com.yh.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yh.service.ExportExcelService;

/**
 * 导出excel
 * @author wangxu
 *
 */
@RestController
@RequestMapping(value = "export")
public class ExportExcelController {
	private static Logger logger=LoggerFactory.getLogger(ExportExcelController.class);
	
	@Autowired
	private ExportExcelService excelExportService;

	@Autowired
	private  HttpServletResponse resp;
	
	/**
	 * 下载
	 * @param map  map 结构  
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
	 * 
	 * @param response
	 * @param token
	 */
	@RequestMapping(value="download",method=RequestMethod.POST)
	public void downLoad(@RequestParam Map<String,Object>map){
		try{
			 String template=(String)map.get("template");
			 byte[]b=this.excelExportService.exportExcel(map);
			 resp.setContentType("application/octet-stream");
			 resp.setHeader("Content-Disposition","attachment;filename=" +  java.net.URLEncoder.encode(template, "UTF-8"));
			 resp.getOutputStream().write(b);
		}catch(Exception e){
			logger.error("下载失败",e);
		}finally {
	        try {
		        resp.getOutputStream().flush();
				resp.getOutputStream().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
	}
	
}

package com.yh.service;

import java.util.List;

import java.util.Map;

/**
 * 数据导出基础service
 * @author wangxu
 *
 * @param <T>
 */
public interface BaseExportService {
	/**
	 * 导出一页时，查询一页数据
	 * @param params 查询条件  
	 *  结构举例
	 * {
	 *  name:'accountService',
	 *  template:'用户列表.xlsx',
	 *  isAllPage:true,
	 *  queryParams:{
	 *  	registercode:'',
	 *      beginDate:'',
	 *      nickname:'',
	 *      phonenumber:'',
	 *      roleid:[],
	 *      pageNum:1,
	 *      pageSize:10
	 *  }
	 * }
	 * @return
	 */
	public  List<?> onePageExportData(String params);
	/**
	 * 导出全部时，查询总行数
	 * @param params 查询条件
	 *  结构举例
	 * {
	 *  name:'accountService',
	 *  template:'用户列表.xlsx',
	 *  isAllPage:true,
	 *  queryParams:{
	 *  	registercode:'',
	 *      beginDate:'',
	 *      nickname:'',
	 *      phonenumber:'',
	 *      roleid:[],
	 *      pageNum:1,
	 *      pageSize:10
	 *  }
	 * }
	 * @return
	 */
	public int totalCount(String params);
	/**
	 * 导出全部时，查询全部的数据
	 * @param params 查询条件
	 *  结构举例
	 * {
	 *  name:'accountService',
	 *  template:'用户列表.xlsx',
	 *  isAllPage:true,
	 *  queryParams:{
	 *  	registercode:'',
	 *      beginDate:'',
	 *      nickname:'',
	 *      phonenumber:'',
	 *      roleid:[],
	 *      pageNum:1,
	 *      pageSize:10
	 *  }
	 * }
	 * @return
	 */
	public List<?> totalExportData(String params);
}




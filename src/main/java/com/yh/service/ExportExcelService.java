package com.yh.service;

import java.io.IOException;
import java.util.Map;

/**
 * excel导出
 * @author wangxu
 *
 */
public interface ExportExcelService {
	
	/**
	 * 导出
	 * @param params 查询数据用到的信息
	 * @param token 当前登录用户的token
	 * @return excel的字节
	 */
	public byte[]exportExcel(Map<String,Object>params)throws IOException;
}

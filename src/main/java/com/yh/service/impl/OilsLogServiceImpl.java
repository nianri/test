package com.yh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.yh.dao.OilsLogMapper;
import com.yh.model.OilsLog;
import com.yh.service.OilsLogService;

@Service("OilsLogService") 
public class OilsLogServiceImpl implements OilsLogService{
	@Resource  
	private OilsLogMapper oilsLogMapper;
	public int insertOilsLog(OilsLog oilsLog){		 
		return oilsLogMapper.insertOilsLog(oilsLog);
	}
}

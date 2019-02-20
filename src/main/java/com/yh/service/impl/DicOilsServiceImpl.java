package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yh.dao.DicOilsMapper;
import com.yh.model.DicOils;
import com.yh.service.DicOilsService;

@Service("DicOilsService") 
public class DicOilsServiceImpl implements DicOilsService{
	@Resource  
	private DicOilsMapper dicOilsMapper;
	
	public List<DicOils> getDicOilsList(){
		return dicOilsMapper.getDicOilsList();
	}
	public List<DicOils> getDicOilsAllList(){
		return dicOilsMapper.getDicOilsAllList();
	}
}

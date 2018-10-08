package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.yh.dao.AdvertInfoMapper;
import com.yh.model.AdvertInfo;
import com.yh.service.AdvertService;

@Service("AdvertService") 
public class AdvertServiceImpl implements AdvertService{
	@Resource  
	private AdvertInfoMapper advertInfoMapper;
	
	public List<AdvertInfo> getAllAdvert(AdvertInfo advertInfo){
		return advertInfoMapper.getAllAdvert(advertInfo);
	}
	public AdvertInfo getAdvertById(String advertId){
		return advertInfoMapper.getAdvertById(advertId);
	}
	public int updateAdvertById(AdvertInfo advertInfo){
		return advertInfoMapper.updateAdvertById(advertInfo);
	}
	public int insertAdvert(AdvertInfo advertInfo){
		return advertInfoMapper.insertAdvert(advertInfo);
	}
	public int deleteAdvertById(AdvertInfo advertInfo){
		return advertInfoMapper.deleteAdvertById(advertInfo);
	}
}

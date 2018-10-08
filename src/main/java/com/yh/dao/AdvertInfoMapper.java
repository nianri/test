package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.yh.model.AdvertInfo;

public interface AdvertInfoMapper {
	int insertAdvert(AdvertInfo advertInfo);
    int insertSelective(AdvertInfo advertInfo);
    List<AdvertInfo> getAllAdvert(AdvertInfo advertInfo);
    AdvertInfo getAdvertById(@Param("advertid") String id);
    int updateAdvertById(AdvertInfo advertInfo);
    int deleteAdvertById(AdvertInfo advertInfo);
}
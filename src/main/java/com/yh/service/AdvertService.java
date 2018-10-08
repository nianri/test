package com.yh.service;

import java.util.List;
import com.yh.model.AdvertInfo;

public interface AdvertService {
	public List<AdvertInfo> getAllAdvert(AdvertInfo advertInfo);
	public AdvertInfo getAdvertById(String advertId);
	public int updateAdvertById(AdvertInfo advertInfo);
	public int insertAdvert(AdvertInfo advertInfo);
	public int deleteAdvertById(AdvertInfo advertInfo);
}

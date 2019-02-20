package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yh.dao.AreaMapper;
import com.yh.model.Area;
import com.yh.service.AreaService;

@Service("AreaService") 
public class AreaServiceImpl implements AreaService{
	@Resource  
	private AreaMapper areaMapper;
	public List<Area> getArea(Area area){
		return areaMapper.getArea(area);
	}
}

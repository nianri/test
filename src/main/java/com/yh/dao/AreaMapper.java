package com.yh.dao;

import java.util.List;

import com.yh.model.Area;

public interface AreaMapper {
    int insert(Area record);
    int insertSelective(Area record);
    List<Area> getArea(Area area);
}
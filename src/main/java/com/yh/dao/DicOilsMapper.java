package com.yh.dao;

import java.util.List;

import com.yh.model.DicOils;

public interface DicOilsMapper {
    int insert(DicOils record);
    int insertSelective(DicOils record);
    List<DicOils> getDicOilsList();
    List<DicOils> getDicOilsAllList();
}
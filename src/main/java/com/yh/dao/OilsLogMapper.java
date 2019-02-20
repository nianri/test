package com.yh.dao;

import com.yh.model.OilsLog;

public interface OilsLogMapper {
    int insertOilsLog(OilsLog oilsLog);
    int insertSelective(OilsLog oilsLog);
}
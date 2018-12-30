package com.yh.service;

import java.util.List;
import com.yh.model.DicExpress;
/**
 *	快递公司接口管理
 *  @Package  com.yh.service.DicExpressService
 *	@cfg.entiName 张金旺
 *	@version Ver 1.0 2018-12-26 20:54:01 新增
 */
public interface DicExpressService  {
        /**
         * 查询快递公司列表
         * @param DicExpress
         * @return
         */
        List<DicExpress> getDicExpressList(DicExpress DicExpress);
}

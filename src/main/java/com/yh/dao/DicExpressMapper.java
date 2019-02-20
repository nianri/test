package com.yh.dao;
import com.yh.model.DicExpress;
import java.util.List;

public interface DicExpressMapper{
    /**
    * 查询快递公司列表
    * @return
    */
    List<DicExpress> getDicExpressList(DicExpress dicExpress);
}
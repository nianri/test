package com.yh.dao;

import org.apache.ibatis.annotations.Param;
import com.yh.model.DicPublicKey;

public interface DicPublicKeyMapper {
    int insertPublicKey(DicPublicKey publicKey);
    int insertSelective(DicPublicKey publicKey);
    public DicPublicKey getPublicKeyByCode(@Param("keycode") String keyCode);
}
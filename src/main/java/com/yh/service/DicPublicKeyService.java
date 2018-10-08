package com.yh.service;

import org.apache.ibatis.annotations.Param;
import com.yh.model.DicPublicKey;

public interface DicPublicKeyService {
	public DicPublicKey getPublicKeyByCode(@Param("keycode") String keyCode);
}

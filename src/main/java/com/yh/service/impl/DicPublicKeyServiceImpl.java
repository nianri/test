package com.yh.service.impl;

import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.yh.dao.DicPublicKeyMapper;
import com.yh.model.DicPublicKey;
import com.yh.service.DicPublicKeyService;

@Service("DicPublicKeyService") 
public class DicPublicKeyServiceImpl implements DicPublicKeyService{
	@Resource  
	private DicPublicKeyMapper publicKeyMapper;
	public DicPublicKey getPublicKeyByCode(@Param("keycode") String keyCode){
		return publicKeyMapper.getPublicKeyByCode(keyCode);
	}	
}

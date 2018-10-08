package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.yh.dao.SysUserMapper;
import com.yh.model.SysUser;
import com.yh.service.SysUserService;

@Service("SysUserService")  
public class SysUserServiceImpl implements SysUserService{
	@Resource  
    private SysUserMapper sysUserMapper;  
	public SysUser getSysUserByCode(@Param("logincode") String logincode ){
		return sysUserMapper.getSysUserByCode(logincode);
	}
	public List<SysUser> getSysUserList(SysUser sysUser){
		return sysUserMapper.getSysUserList(sysUser);
	}
	public SysUser getSysUserById(@Param("userid") String userId){
		return sysUserMapper.getSysUserById(userId);
	}
	public int deleteSysUserById(@Param("userid") String userId){
		return sysUserMapper.deleteSysUserById(userId);
	}
	public int updateSysUserById(SysUser sysUser){
		return sysUserMapper.updateSysUserById(sysUser);
	}
	public int insertSysUser(SysUser sysUser){
		return sysUserMapper.insertSysUser(sysUser);
	}
	public int isExistLogincode(SysUser sysUser){
		return sysUserMapper.isExistLogincode(sysUser).size();
	}
	public  int reSysUserPwd(SysUser sysUser){
		return sysUserMapper.reSysUserPwd(sysUser);
	}
	
}

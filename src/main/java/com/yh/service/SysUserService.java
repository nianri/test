package com.yh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.MemberInfo;
import com.yh.model.SysUser;

public interface SysUserService {
	public SysUser getSysUserByCode(@Param("logincode")  String logincode);
	public List<SysUser> getSysUserList(SysUser sysUser);
	public SysUser getSysUserById(@Param("userid") String userId);
	public int deleteSysUserById(@Param("userid") String userId);
	public int updateSysUserById(SysUser sysUser);
	public int insertSysUser(SysUser sysUser);
	public int isExistLogincode(SysUser sysUser);
	public  int reSysUserPwd(SysUser sysUser);
	public void updatePwdByPhone(SysUser sysUser);
	
}

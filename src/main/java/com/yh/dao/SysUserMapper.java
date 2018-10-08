package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.SysUser;

public interface SysUserMapper {
    int insertSysUser(SysUser sysUser);
    SysUser getSysUserByCode(@Param("logincode") String logincode);
    List<SysUser> getSysUserList(SysUser sysUser);
    SysUser getSysUserById(String userId);
    int deleteSysUserById(@Param("userid") String userId);
    int updateSysUserById(SysUser sysUser);
    List<SysUser> isExistLogincode(SysUser sysUser);
    int reSysUserPwd(SysUser sysUser);
}
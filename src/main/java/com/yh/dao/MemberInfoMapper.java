package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.MemberInfo;

public interface MemberInfoMapper {
    List<MemberInfo> getMemberList(MemberInfo memberInfo);
    int updateMemberById(MemberInfo memberInfo);
    int deleteMemberById(@Param("memberid") String memberid);
    MemberInfo getMemberById(@Param("memberid") String memberid);
}
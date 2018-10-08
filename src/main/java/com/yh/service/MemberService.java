package com.yh.service;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yh.model.MemberInfo;

public interface MemberService {
	public List<MemberInfo> getMemberList(MemberInfo memberInfo);	
    public MemberInfo getMemberById(@Param("memberid") String memberId);
    public int deleteMemberById(@Param("memberid") String memberId);
    public int updateMemberById(MemberInfo couponInfo);
}

package com.yh.service.impl;

import java.util.List;
import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.yh.dao.MemberInfoMapper;
import com.yh.model.MemberInfo;
import com.yh.service.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberInfoMapper memberInfoMapper;

	public List<MemberInfo> getMemberList(MemberInfo memberInfo) {
		return memberInfoMapper.getMemberList(memberInfo);
	}

	public MemberInfo getMemberById(@Param("memberid") String memberId) {
		return memberInfoMapper.getMemberById(memberId);
	}

	public int deleteMemberById(@Param("memberid") String memberId) {
		return memberInfoMapper.deleteMemberById(memberId);
	}

	public int updateMemberById(MemberInfo memberInfo) {
		return memberInfoMapper.updateMemberById(memberInfo);
	}
}

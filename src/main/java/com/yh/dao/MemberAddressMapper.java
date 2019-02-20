package com.yh.dao;

import com.yh.model.MemberAddress;

public interface MemberAddressMapper {
    int insert(MemberAddress record);

    int insertSelective(MemberAddress record);
}
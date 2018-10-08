package com.yh.model;

import java.io.Serializable;

import javax.persistence.Table;

@Table(name = "member_address")
public class MemberAddress implements Serializable{
	private static final long serialVersionUID = 1L;
    private String maddressid;

    private String memberid;

    private String provinceid;

    private String cityid;

    private String countryid;

    private String address;

    private String creatorid;

    public String getMaddressid() {
        return maddressid;
    }

    public void setMaddressid(String maddressid) {
        this.maddressid = maddressid == null ? null : maddressid.trim();
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid == null ? null : memberid.trim();
    }

    public String getProvinceid() {
        return provinceid;
    }

    public void setProvinceid(String provinceid) {
        this.provinceid = provinceid == null ? null : provinceid.trim();
    }

    public String getCityid() {
        return cityid;
    }

    public void setCityid(String cityid) {
        this.cityid = cityid == null ? null : cityid.trim();
    }

    public String getCountryid() {
        return countryid;
    }

    public void setCountryid(String countryid) {
        this.countryid = countryid == null ? null : countryid.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(String creatorid) {
        this.creatorid = creatorid == null ? null : creatorid.trim();
    }
}
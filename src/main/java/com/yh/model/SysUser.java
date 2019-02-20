package com.yh.model;

import java.io.Serializable;

import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "sys_user")
public class SysUser implements Serializable{
	private static final long serialVersionUID = 1L;
    private String userid;

    private Integer usercode;

    private String logincode;

    private String realname;

    private String password;

    private String usertype;

    private String shopid;

    private String islogin;

    private String lastlogtime;

    private String createtime;

    private String creatorid;

    private String status;

    private String isdelete;

    private String memo;
    @Transient
    private String shopname;
    
    private String phonenum;
    @Transient
    private String hash;
    @Transient
    private String smscode;
    @Transient
    private String tamp;
    
    public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getUsercode() {
        return usercode;
    }

    public void setUsercode(Integer usercode) {
        this.usercode = usercode;
    }

    public String getLogincode() {
        return logincode;
    }

    public void setLogincode(String logincode) {
        this.logincode = logincode == null ? null : logincode.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype == null ? null : usertype.trim();
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid == null ? null : shopid.trim();
    }

    public String getIslogin() {
        return islogin;
    }

    public void setIslogin(String islogin) {
        this.islogin = islogin == null ? null : islogin.trim();
    }

    public String getLastlogtime() {
        return lastlogtime;
    }

    public void setLastlogtime(String lastlogtime) {
        this.lastlogtime = lastlogtime == null ? null : lastlogtime.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(String creatorid) {
        this.creatorid = creatorid == null ? null : creatorid.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(String isdelete) {
        this.isdelete = isdelete == null ? null : isdelete.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public String getSmscode() {
		return smscode;
	}

	public void setSmscode(String smscode) {
		this.smscode = smscode;
	}

	public String getTamp() {
		return tamp;
	}

	public void setTamp(String tamp) {
		this.tamp = tamp;
	}
    
	
}
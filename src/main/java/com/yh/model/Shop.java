package com.yh.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "shop_info")
public class Shop implements Serializable{
	private static final long serialVersionUID = 1L;
	@Column(name = "shopid")
    private String shopid;

    private String userid;

    private Integer shopcode;

    private String shopname;

    private String shopdesc;

    private String shopservice;

    private String proviceid;

    private String cityid;

    private String address;

    private String positionxy;

    private String shoplogo;

    private String shopimg;

    private String leadername;

    private String leadertel;

    private String leaderemail;

    private String accountbank;

    private String accountnums;

    private String accountname;

    private String licenseimg;

    private String prolicenseimg;

    private String cardtop;

    private String carddown;

    private String createtime;

    private String creatorid;

    private String isdelete;

    private String status;

    private String memo;

    private String mchid;

    private String trmno;

    private String shopkey;

    @Transient
    private String provicename;//省
    @Transient
    private String cityname;//市
    @Transient
    private String countyname;//县(区)
    @Transient
    private String checkstatus;//入驻审核状态
    @Transient
    private String submittime;//申请提交时间
    @Transient
    private String member;//提交人
    
    public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
	}

	public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getShopcode() {
        return shopcode;
    }

    public void setShopcode(Integer shopcode) {
        this.shopcode = shopcode;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname == null ? null : shopname.trim();
    }

    public String getShopdesc() {
        return shopdesc;
    }

    public void setShopdesc(String shopdesc) {
        this.shopdesc = shopdesc == null ? null : shopdesc.trim();
    }

    public String getShopservice() {
        return shopservice;
    }

    public void setShopservice(String shopservice) {
        this.shopservice = shopservice == null ? null : shopservice.trim();
    }

    public String getProviceid() {
        return proviceid;
    }

    public void setProviceid(String proviceid) {
        this.proviceid = proviceid == null ? null : proviceid.trim();
    }

    public String getCityid() {
        return cityid;
    }

    public void setCityid(String cityid) {
        this.cityid = cityid == null ? null : cityid.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPositionxy() {
        return positionxy;
    }

    public void setPositionxy(String positionxy) {
        this.positionxy = positionxy == null ? null : positionxy.trim();
    }

    public String getShoplogo() {
        return shoplogo;
    }

    public void setShoplogo(String shoplogo) {
        this.shoplogo = shoplogo == null ? null : shoplogo.trim();
    }

    public String getShopimg() {
        return shopimg;
    }

    public void setShopimg(String shopimg) {
        this.shopimg = shopimg == null ? null : shopimg.trim();
    }

    public String getLeadername() {
        return leadername;
    }

    public void setLeadername(String leadername) {
        this.leadername = leadername == null ? null : leadername.trim();
    }

    public String getLeadertel() {
        return leadertel;
    }

    public void setLeadertel(String leadertel) {
        this.leadertel = leadertel == null ? null : leadertel.trim();
    }

    public String getLeaderemail() {
        return leaderemail;
    }

    public void setLeaderemail(String leaderemail) {
        this.leaderemail = leaderemail == null ? null : leaderemail.trim();
    }

    public String getAccountbank() {
        return accountbank;
    }

    public void setAccountbank(String accountbank) {
        this.accountbank = accountbank == null ? null : accountbank.trim();
    }

    public String getAccountnums() {
        return accountnums;
    }

    public void setAccountnums(String accountnums) {
        this.accountnums = accountnums == null ? null : accountnums.trim();
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname == null ? null : accountname.trim();
    }

    public String getLicenseimg() {
        return licenseimg;
    }

    public void setLicenseimg(String licenseimg) {
        this.licenseimg = licenseimg == null ? null : licenseimg.trim();
    }

    public String getProlicenseimg() {
        return prolicenseimg;
    }

    public void setProlicenseimg(String prolicenseimg) {
        this.prolicenseimg = prolicenseimg == null ? null : prolicenseimg.trim();
    }

    public String getCardtop() {
        return cardtop;
    }

    public void setCardtop(String cardtop) {
        this.cardtop = cardtop == null ? null : cardtop.trim();
    }

    public String getCarddown() {
        return carddown;
    }

    public void setCarddown(String carddown) {
        this.carddown = carddown == null ? null : carddown.trim();
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

    public String getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(String isdelete) {
        this.isdelete = isdelete == null ? null : isdelete.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getMchid() {
        return mchid;
    }

    public void setMchid(String mchid) {
        this.mchid = mchid == null ? null : mchid.trim();
    }

    public String getTrmno() {
        return trmno;
    }

    public void setTrmno(String trmno) {
        this.trmno = trmno == null ? null : trmno.trim();
    }

    public String getShopkey() {
        return shopkey;
    }

    public void setShopkey(String shopkey) {
        this.shopkey = shopkey == null ? null : shopkey.trim();
    }

	public String getCheckstatus() {
		return checkstatus;
	}

	public void setCheckstatus(String checkstatus) {
		this.checkstatus = checkstatus;
	}

	public String getSubmittime() {
		return submittime;
	}

	public void setSubmittime(String submittime) {
		this.submittime = submittime;
	}

	public String getProvicename() {
		return provicename;
	}

	public void setProvicename(String provicename) {
		this.provicename = provicename;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getCountyname() {
		return countyname;
	}

	public void setCountyname(String countyname) {
		this.countyname = countyname;
	}

	
    
}
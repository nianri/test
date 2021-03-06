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

    private Integer shopcode;

    private String shopname;

    private String shopdesc;

    private String shopservice;

    private String provinceid;

    private String cityid;
    private String countyid;
    
    private String address;
    
    private String areadesc;

    private String shopimg;

    private String leadername;

    private String leadertel;

    private String leaderemail;

    private String licenseimg;

    private String prolicenseimg;

    private String cardtop;

    private String carddown;

    private String createtime;

    private String creatorid;

    private String isdelete;

    private String status;

    private String memo;
    private String accountnums;
    private String accountbank;
    private String accountname;
    private String cusid;
    private String appid;
    private String appkey;
    private Double longitude;
    private Double latitude;
    private String shopsources;
    private String shoplevel;
    @Transient
    private String provincename;
    @Transient
    private String cityname;
    @Transient
    private String countyname;  
    @Transient
    private String submittime;
    @Transient
    private String realname;
    
    
    public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public String getAccountnums() {
		return accountnums;
	}

	public void setAccountnums(String accountnums) {
		this.accountnums = accountnums;
	}

	public String getAccountbank() {
		return accountbank;
	}

	public void setAccountbank(String accountbank) {
		this.accountbank = accountbank;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
	}


	public String getShoplevel() {
		return shoplevel;
	}

	public void setShoplevel(String shoplevel) {
		this.shoplevel = shoplevel;
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

    

    public String getProvinceid() {
		return provinceid;
	}

	public void setProvinceid(String provinceid) {
		this.provinceid = provinceid;
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

    public String getShopsources() {
		return shopsources;
	}

	public void setShopsources(String shopsources) {
		this.shopsources = shopsources;
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


	public String getSubmittime() {
		return submittime;
	}

	public void setSubmittime(String submittime) {
		this.submittime = submittime;
	}

	public String getProvincename() {
		return provincename;
	}

	public void setProvincename(String provincename) {
		this.provincename = provincename;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}


	public String getCountyname() {
		return countyname;
	}

	public void setCountyname(String countyname) {
		this.countyname = countyname;
	}

	public String getAreadesc() {
		return areadesc;
	}

	public void setAreadesc(String areadesc) {
		this.areadesc = areadesc;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public String getCusid() {
		return cusid;
	}

	public void setCusid(String cusid) {
		this.cusid = cusid;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getAppkey() {
		return appkey;
	}

	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}

	public String getCountyid() {
		return countyid;
	}

	public void setCountyid(String countyid) {
		this.countyid = countyid;
	}
	
	
    
}
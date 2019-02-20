package com.yh.model;

import java.io.Serializable;

import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "advert_info")
public class AdvertInfo implements Serializable{
	private static final long serialVersionUID = 1L;
    private String advertid;

    private String advertname;

    private String provinceid;

    private String cityid;

    private String countyid;

    private String ordernum;

    private String imageurl;

    private String detailpage;

    private String createtime;

    private String creatorid;

    private String status;
    private String adverttype;
    private String memo;
    
    @Transient
    private String provincename;
    @Transient
    private String cityname;
    @Transient
    private String countyname;
    
    public String getAdvertid() {
        return advertid;
    }

    public void setAdvertid(String advertid) {
        this.advertid = advertid == null ? null : advertid.trim();
    }

    public String getAdvertname() {
        return advertname;
    }

    public void setAdvertname(String advertname) {
        this.advertname = advertname == null ? null : advertname.trim();
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

    public String getCountyid() {
		return countyid;
	}

	public void setCountyid(String countyid) {
		this.countyid = countyid;
	}

	public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum == null ? null : ordernum.trim();
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl == null ? null : imageurl.trim();
    }

    public String getDetailpage() {
        return detailpage;
    }

    public void setDetailpage(String detailpage) {
        this.detailpage = detailpage == null ? null : detailpage.trim();
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

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
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

	public String getAdverttype() {
		return adverttype;
	}

	public void setAdverttype(String adverttype) {
		this.adverttype = adverttype;
	}
    
}
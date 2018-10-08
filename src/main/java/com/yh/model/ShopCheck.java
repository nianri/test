package com.yh.model;

import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "shop_check")
public class ShopCheck {
    private String scheckid;

    private String shopid;

    private String submittime;

    private String checktime;

    private String checkdesc;

    private String userid;

    private String status;

    private String memo;
    private String auditorid;
    @Transient
    private String submitname;
    @Transient
    private String auditorname;
    @Transient
    private String positionxy;
    
    public String getScheckid() {
        return scheckid;
    }

    public void setScheckid(String scheckid) {
        this.scheckid = scheckid == null ? null : scheckid.trim();
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid == null ? null : shopid.trim();
    }

    public String getSubmittime() {
        return submittime;
    }

    public void setSubmittime(String submittime) {
        this.submittime = submittime == null ? null : submittime.trim();
    }

    public String getChecktime() {
        return checktime;
    }

    public void setChecktime(String checktime) {
        this.checktime = checktime == null ? null : checktime.trim();
    }

    public String getCheckdesc() {
        return checkdesc;
    }

    public void setCheckdesc(String checkdesc) {
        this.checkdesc = checkdesc == null ? null : checkdesc.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
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

	public String getAuditorid() {
		return auditorid;
	}

	public void setAuditorid(String auditorid) {
		this.auditorid = auditorid;
	}

	public String getSubmitname() {
		return submitname;
	}

	public void setSubmitname(String submitname) {
		this.submitname = submitname;
	}

	public String getAuditorname() {
		return auditorname;
	}

	public void setAuditorname(String auditorname) {
		this.auditorname = auditorname;
	}

	public String getPositionxy() {
		return positionxy;
	}

	public void setPositionxy(String positionxy) {
		this.positionxy = positionxy;
	}
    
}
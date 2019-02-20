package com.yh.model;

import java.io.Serializable;

import javax.persistence.Table;

@Table(name = "dic_publickey")
public class DicPublicKey implements Serializable{
	private static final long serialVersionUID = 1L;
	
    private String publickeyid;

    private String keycode;

    private String keyname;

    private String keyvalue;

    private String createtime;

    private String status;

    private String memo;

    public String getPublickeyid() {
        return publickeyid;
    }

    public void setPublickeyid(String publickeyid) {
        this.publickeyid = publickeyid == null ? null : publickeyid.trim();
    }

    public String getKeycode() {
        return keycode;
    }

    public void setKeycode(String keycode) {
        this.keycode = keycode == null ? null : keycode.trim();
    }

    public String getKeyname() {
        return keyname;
    }

    public void setKeyname(String keyname) {
        this.keyname = keyname == null ? null : keyname.trim();
    }

    public String getKeyvalue() {
        return keyvalue;
    }

    public void setKeyvalue(String keyvalue) {
        this.keyvalue = keyvalue == null ? null : keyvalue.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
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
}
package com.yh.model;

public class DicOils {
    private String oilsid;

    private String oilscode;

    private String oilsname;

    private String oilsdesc;

    private String oilstype;

    private String ordernum;

    private String createtime;

    private String creatorid;

    private String status;

    private String memo;

    public String getOilsid() {
        return oilsid;
    }

    public void setOilsid(String oilsid) {
        this.oilsid = oilsid == null ? null : oilsid.trim();
    }

    public String getOilscode() {
        return oilscode;
    }

    public void setOilscode(String oilscode) {
        this.oilscode = oilscode == null ? null : oilscode.trim();
    }

    public String getOilsname() {
        return oilsname;
    }

    public void setOilsname(String oilsname) {
        this.oilsname = oilsname == null ? null : oilsname.trim();
    }

    public String getOilsdesc() {
        return oilsdesc;
    }

    public void setOilsdesc(String oilsdesc) {
        this.oilsdesc = oilsdesc == null ? null : oilsdesc.trim();
    }

    public String getOilstype() {
        return oilstype;
    }

    public void setOilstype(String oilstype) {
        this.oilstype = oilstype == null ? null : oilstype.trim();
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum == null ? null : ordernum.trim();
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
}
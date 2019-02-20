package com.yh.model;


import java.io.Serializable;
import javax.persistence.Table;

@Table( name="dic_express")
public class DicExpress implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
    * 快递公司ID
    */
    private String expressid;
    /**
    * 快递公司编号
    */
    private Integer expresscode;
    /**
    * 快递公司名称
    */
    private String expressname;
    /**
    * 创建日期
    */
    private String createtime;
    /**
    * 创建人
    */
    private String createorid;
    /**
    * 状态 0:禁用1:启用
    */
    private String status;
    /**
    * 备注
    */
    private String memo;


    public String getExpressid() {
        return expressid;
    }

    public void setExpressid(String expressid) {
        this.expressid = expressid;
    }

    public Integer getExpresscode() {
        return expresscode;
    }

    public void setExpresscode(Integer expresscode) {
        this.expresscode = expresscode;
    }

    public String getExpressname() {
        return expressname;
    }

    public void setExpressname(String expressname) {
        this.expressname = expressname;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getCreateorid() {
        return createorid;
    }

    public void setCreateorid(String createorid) {
        this.createorid = createorid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }


}

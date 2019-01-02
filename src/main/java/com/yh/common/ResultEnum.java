package com.yh.common;

public enum ResultEnum {
	SUCCESS("001","操作成功。"),
	FAILED("002","操作失败！"),	
	SAVE_SUCCESS("SS01","保存成功。"),
	REPLY_SUCCESS("RS01","回复成功。"),
    SAVE_FAILED("SF02","保存失败！"),	
    DELETE_SUCCESS("DS01","删除成功。"),
    DELETE_FAILED("DF02","删除失败！"),
    ERROR("E03", "系统报错！"),
    YES_EXISTS("YES01","该数据已存在！"),
    NOT_EXISTS("NOT02","该数据不存在！"),
	ERROR_KEY("KEY00","参数异常或不匹配");
    /*NOT_LOGIN("004", "用户没有登录或登录已过期"),
    NO_AUTHORITY("005", "用户没有权限"),
    NOT_EXITS("006","用户不存在"),   
    FREEZE_SUCCESS("001","冻结成功"),
    FREEZE_FAILURE("002","冻结失败"),
    THAW_SUCCESS("001","解冻成功"),
    DEFROST_FAILURE("002","解冻失败"),   
    LIST_NOT_EXITS("008","列表为空"),
    PARAM_ERROR("007","参数错误"),
    CLASSIFICATION_CODE("002","code值不存在"),
    DATA_NOT_EXIST("009","数据不存在"),
    NOT_SELECT_DATA("100","未选择数据" ),
    PARAM_ILLEGAL("007", "传入参数有误");*/

    private String code;
    private String info;

    ResultEnum(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}

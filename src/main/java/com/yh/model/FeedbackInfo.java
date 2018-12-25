package com.yh.model;


import java.io.Serializable;
import javax.persistence.Table;

@Table( name="feedback_info")
public class FeedbackInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
    * 意见反馈ID
    */
    private String feedbackid;
    /**
    * 反馈时间
    */
    private String feedbacktime;
    /**
    * 反馈人ID
    */
    private String memberid;
    /**
     * 反馈人名字
     */
     private String membername;
    /**
    * 反馈意见
    */
    private String feedbackmsg;
    /**
    * 反馈图片
    */
    private String feedbackimg;
    /**
    * 回复内容
    */
    private String replymsg;
    /**
    * 状态 0:未回复1:已回复
    */
    private String status;
    /**
    * 备注
    */
    private String memo;


    public String getFeedbackid() {
        return feedbackid;
    }

    public void setFeedbackid(String feedbackid) {
        this.feedbackid = feedbackid;
    }

    public String getFeedbacktime() {
        return feedbacktime;
    }

    public void setFeedbacktime(String feedbacktime) {
        this.feedbacktime = feedbacktime;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getFeedbackmsg() {
        return feedbackmsg;
    }

    public void setFeedbackmsg(String feedbackmsg) {
        this.feedbackmsg = feedbackmsg;
    }

    public String getFeedbackimg() {
        return feedbackimg;
    }

    public void setFeedbackimg(String feedbackimg) {
        this.feedbackimg = feedbackimg;
    }

    public String getReplymsg() {
        return replymsg;
    }

    public void setReplymsg(String replymsg) {
        this.replymsg = replymsg;
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

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}
    

}

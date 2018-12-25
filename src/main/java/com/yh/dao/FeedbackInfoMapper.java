package com.yh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yh.model.FeedbackInfo;

public interface FeedbackInfoMapper{

	List<FeedbackInfo> getFeedbackInfoList(FeedbackInfo feedbackInfo);

	FeedbackInfo getFeedbackInfo(String feedbackid);

	void updateFeedbackInfoById(FeedbackInfo feedbackInfo);

}
package com.yh.service;

import java.util.List;

import com.yh.model.FeedbackInfo;

public interface FeedbackInfoService {

	/**
	 * 查询意见反馈列表
	 * @param feedbackInfo
	 * @return
	 */
	List<FeedbackInfo> getFeedbackInfoList(FeedbackInfo feedbackInfo);

	/**
	 * 查看意见反馈详情
	 * @param feedbackid
	 * @return
	 */
	FeedbackInfo getFeedbackInfo(String feedbackid);

	/**
	 * 修改意见反馈
	 * @param feedbackInfo
	 */
	void updateFeedbackInfo(FeedbackInfo feedbackInfo);

}

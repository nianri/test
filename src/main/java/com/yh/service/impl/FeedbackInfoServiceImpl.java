package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.yh.dao.FeedbackInfoMapper;
import com.yh.model.FeedbackInfo;
import com.yh.service.FeedbackInfoService;

@Service
public class FeedbackInfoServiceImpl implements FeedbackInfoService{

	@Resource
	private FeedbackInfoMapper feedbackInfoMapper;
	@Override
	public List<FeedbackInfo> getFeedbackInfoList(FeedbackInfo feedbackInfo) {
		return feedbackInfoMapper.getFeedbackInfoList(feedbackInfo);
	}
	@Override
	public FeedbackInfo getFeedbackInfo(String feedbackid) {
		return feedbackInfoMapper.getFeedbackInfo(feedbackid);
	}
	@Override
	@Transactional
	public void updateFeedbackInfo(FeedbackInfo feedbackInfo) {
		feedbackInfoMapper.updateFeedbackInfoById(feedbackInfo);
		
	}

}

package com.yh.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.yh.dao.FeedbackInfoMapper;
import com.yh.model.FeedbackInfo;
import com.yh.model.GoodsOrder;
import com.yh.service.BaseExportService;
import com.yh.service.FeedbackInfoService;

@Service("feedbackInfoService")
public class FeedbackInfoServiceImpl implements FeedbackInfoService,BaseExportService{

	@Resource
	private FeedbackInfoMapper feedbackInfoMapper;
	@Override
	public List<FeedbackInfo> getFeedbackInfoList(FeedbackInfo feedbackInfo) {
		return feedbackInfoMapper.getFeedbackInfoList(feedbackInfo);
	}

	private int getFeedbackInfoCount(FeedbackInfo feedbackInfo) {
		return getFeedbackInfoList(feedbackInfo).size();
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
	@Override
	public List<?> onePageExportData(String params) {
		// TODO 自动生成的方法存根
		return null;
	}
	@Override
	public int totalCount(String params) {
		FeedbackInfo feedbackInfo=JSONObject.parseObject(params, FeedbackInfo.class);
		return getFeedbackInfoCount(feedbackInfo);
	}

	@Override
	public List<?> totalExportData(String params) {
		FeedbackInfo feedbackInfo=JSONObject.parseObject(params, FeedbackInfo.class);
		return getFeedbackInfoList(feedbackInfo);
	}

}

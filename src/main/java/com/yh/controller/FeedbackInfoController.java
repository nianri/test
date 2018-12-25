package com.yh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.yh.model.FeedbackInfo;
import com.yh.model.Goods;
import com.yh.service.FeedbackInfoService;
/**
 * 
 *     
 * 项目名称：yh    
 * 类名称：FeedbackInfoController    
 * 类描述：    意见反馈
 * 创建人：jw    
 * 创建时间：2018年12月25日 下午12:19:56    
 * 修改人：jw    
 * 修改时间：2018年12月25日 下午12:19:56    
 * 修改备注：    
 * @version     
 *
 */
@Controller
@RequestMapping("feedbackInfo")
public class FeedbackInfoController {
    private static final Log logger = LogFactory.getLog(FeedbackInfoController.class);
    
    @Resource
    public FeedbackInfoService feedbackInfoService;
    /**
     * 
     * feedbackInfoList(打开意见反馈列表页面) 
     * 2018年12月25日
     */
    @GetMapping("feedbackInfoList")
    public String feedbackInfoList() {
        logger.info("打开意见反馈列表页面");
        return "feedback/feedback_list";
    }

    /**
     * 意见反馈-列表-查询
     * @param feedbackInfo
     * @return
     */
    @RequestMapping(value = {"getFeedbackInfoList"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
    public  @ResponseBody List<FeedbackInfo> getFeedbackInfoList(@RequestBody FeedbackInfo feedbackInfo) {
        List<FeedbackInfo> feedbackInfoList = new ArrayList<FeedbackInfo>();     
        try{
            feedbackInfoList=feedbackInfoService.getFeedbackInfoList(feedbackInfo);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return feedbackInfoList;
    }
    
    //查看反馈意见详情
  	@GetMapping("getFeedbackInfo/{feedbackid}")
  	public String getFeedbackInfo(@PathVariable(name ="feedbackid") String feedbackid, Model model) {
  		if(feedbackid.trim().length()<=0) return "";
  		FeedbackInfo feedbackInfo = new FeedbackInfo();
  		feedbackInfo=feedbackInfoService.getFeedbackInfo(feedbackid); 
  		model.addAttribute("info", feedbackInfo); 
  		return "feedback/feedback_detail";
  	}
  	
  	@PostMapping("updateFeedbackInfo")
  	@ResponseBody
  	public Object updateFeedbackInfo(@RequestBody FeedbackInfo feedbackInfo) {
  		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();	   
         try{
       		feedbackInfoService.updateFeedbackInfo(feedbackInfo);
    		resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
  		return resultInfo;
  	}
}

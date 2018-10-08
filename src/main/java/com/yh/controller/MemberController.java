package com.yh.controller;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yh.model.MemberInfo;
import com.yh.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Log logger = LogFactory.getLog(MemberController.class);
	@Resource
	private MemberService memberService;
	/**
	 * 打开会员列表页面
	 * @return
	 */
	@RequestMapping(value = {"memberList"}, method = {RequestMethod.GET})
	public String memberList() {
		return "member/member_list";		
	}
	/**
	 * 会员列表-查询
	 * @param memberInfo
	 * @return
	 */
	@RequestMapping(value = {"memberSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<MemberInfo> memberSearch(@RequestBody MemberInfo memberInfo) {
		List<MemberInfo> memberList = new ArrayList<MemberInfo>();		
		try{
			memberList=memberService.getMemberList(memberInfo);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
        return memberList;
	}
	/**
	 * 会员详情
	 * @param memberId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getMemberById/{memberid}"}, method = {RequestMethod.GET})
	public String getMemberById(@PathVariable(name ="memberid") String memberId,Model model) {	 
		try{
			MemberInfo memberInfo=memberService.getMemberById(memberId);
			model.addAttribute("member", memberInfo);			
		}catch(Exception ex){
			logger.error(ex.getMessage());
		}	
		return "member/member_detail";		
	}
}

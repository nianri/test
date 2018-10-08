package com.yh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
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
import com.alibaba.fastjson.JSON;
import com.yh.common.MD5Util;
import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.yh.common.common;
import com.yh.model.SysUser;
import com.yh.service.SysUserService;

@Controller
@RequestMapping("/sysUser")
public class SysUserController {
	private static final Log logger = LogFactory.getLog(ShopController.class);
	@Resource
	private SysUserService sysUserService;
	/**
	 * 系统用户列表
	 * @return
	 */
	@RequestMapping(value = {"sysUserList"}, method = {RequestMethod.GET})
	public String sysUserList() {
		return "sysuser/sysuser_list";		
	}
	/**
	 * 系统用户列表-查询
	 * @param sysUser
	 * @return
	 */
	@RequestMapping(value = {"sysUserSearch"}, method = {RequestMethod.POST}, produces = {"application/json;charset=UTF-8"})
	public  @ResponseBody List<SysUser> sysUserSearch(@RequestBody SysUser sysUser) {
		List<SysUser> userList = new ArrayList<SysUser>();		
		try{
			System.out.println(JSON.toJSON(sysUser));
			userList=sysUserService.getSysUserList(sysUser);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		System.out.println("条目："+userList.size());
        return userList;
	}
	/**
	 * 添加系统用户
	 * @return
	 */
	@RequestMapping(value = {"addSysUser"}, method = {RequestMethod.GET})
	public String addSysUser() {
		return "sysuser/sysuser_add";		
	}
	/**
	 * 查看系统用户详情
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getSysUserById/{userid}"}, method = {RequestMethod.GET})
	public String getSysUserById(@PathVariable(name ="userid") String userId,Model model) {	 
		try{
			SysUser sysUser=sysUserService.getSysUserById(userId);
			System.out.println("<><>"+JSON.toJSONString(sysUser));
			model.addAttribute("user", sysUser);			
		}catch(Exception ex){
			logger.error(ex.getMessage());
		}	
		return "sysuser/sysuser_detail";		
	}
	/**
	 * 编辑用户
	 * @param goodsId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"editSysUser/{userid}"}, method = {RequestMethod.GET})
	public String editSysUser(@PathVariable(name ="userid") String userId, Model model) {
		if(userId.trim().length()<=0) return "";
		SysUser sysUser = new SysUser();
		sysUser=sysUserService.getSysUserById(userId); 
		model.addAttribute("sysUser", sysUser); 
		return "sysuser/sysuser_add";
	}
	@RequestMapping(value = {"deleteSysUser/{userid}"}, method = {RequestMethod.POST})
	public @ResponseBody Object deleteSysUser(@PathVariable(name ="userid") String userId, Model model) {
		if(userId.trim().length()<=0) return "";
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			sysUserService.deleteSysUserById(userId);
			resultInfo.setCode(ResultEnum.DELETE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.DELETE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
		return resultInfo;
	}
	@RequestMapping(value = {"saveSysUser"}, method = {RequestMethod.POST})
	public @ResponseBody Object saveSysUser(@RequestBody SysUser sysUser) {
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();	
		
		try{
			if(sysUserService.isExistLogincode(sysUser)>0){
				resultInfo.setCode(ResultEnum.YES_EXISTS.getCode());
		        resultInfo.setInfo(ResultEnum.YES_EXISTS.getInfo());
		        return resultInfo;
			};			
			if(sysUser.getUserid()!=null && !"".equals(sysUser.getUserid())){
				sysUserService.updateSysUserById(sysUser);
			}else{
				sysUser.setUserid(UUID.randomUUID().toString());
				sysUser.setCreatetime(common.GetNowDate().toString());
				sysUser.setIsdelete("1");
				sysUser.setCreatorid(common.getSession().getAttribute("userid").toString());
				sysUser.setPassword(MD5Util.MD5(sysUser.getPassword()));
				System.out.println(JSON.toJSON(sysUser));
				sysUserService.insertSysUser(sysUser);
			}				
			resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
	        resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
		}catch(Exception ex){
			resultInfo.setCode(ResultEnum.ERROR.getCode());
	        resultInfo.setInfo(ResultEnum.ERROR.getInfo());
			logger.error(ex.getMessage());
		}
		return resultInfo;
	}
	
	@RequestMapping(value = {"reSysUserPwd/{userid}"}, method = {RequestMethod.POST})
	public @ResponseBody Object reSysUserPwd(@PathVariable(name ="userid") String userId, Model model) {
		if(userId.trim().length()<=0) return "";
		ResultInfo<Map<String, Object>> resultInfo = new ResultInfo<>();
		try{
			SysUser sysUser = new SysUser();
			sysUser.setUserid(userId);
			sysUser.setPassword(MD5Util.MD5("666666"));
			sysUserService.reSysUserPwd(sysUser);
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

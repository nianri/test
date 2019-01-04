package com.yh.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.yh.common.MD5Util;
import com.yh.model.SysUser;
import com.yh.service.SysUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Log logger = LogFactory.getLog(AdminController.class);
	@Resource
	private SysUserService sysUserService;
	
	@RequestMapping(value = { "/welcome" }, method = { RequestMethod.GET })
	public String welcome2() {
		return "welcome";
	}	
	@RequestMapping(value = { "/login" }, method = { RequestMethod.GET })
	public String login() {
		return "login";
	}
	/**
	 * 登录判断
	 * @param user
	 * @param checkcode
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "clogin" }, method = { RequestMethod.POST })		
	public String clogin(SysUser sysUser,String checkcode,HttpServletRequest request,Model model) {
		String validKey = (String) request.getSession().getAttribute("validKey");
		if (validKey == null || !validKey.equals(checkcode)) { 
			model.addAttribute("message", "验证码错误");
			return "login";
		};		
		try {
			String passWord = MD5Util.MD5(sysUser.getPassword()); 
			SysUser tempSysUser = sysUserService.getSysUserByCode(sysUser.getLogincode()); 
			
			if(tempSysUser==null || tempSysUser.getLogincode()==null||"".equals(tempSysUser.getLogincode())){
				model.addAttribute("message", "账户不存在！");
				return "login";
			}
			if("1".equals(tempSysUser.getStatus())){
				model.addAttribute("message", "帐号已被禁用!");
				return "login";
			}
			if("0".equals(tempSysUser.getStatus())){
				model.addAttribute("message", "帐号已被冻结!");
				return "login";
			}
			if(!passWord.equals(tempSysUser.getPassword())){
				model.addAttribute("message", "密码错误，请重新输入！");
				return "login";
			};	
			//model.addAttribute("isFistLogin","1");	
			request.getSession().setAttribute("logincode",tempSysUser.getLogincode());
			request.getSession().setAttribute("userid",tempSysUser.getUserid());
			request.getSession().setAttribute("realname",tempSysUser.getRealname());
			request.getSession().setAttribute("shopid",tempSysUser.getShopid());
			request.getSession().setAttribute("shopname",tempSysUser.getShopname());
			
			model.addAttribute("logincode", tempSysUser.getLogincode());
			model.addAttribute("realname", tempSysUser.getRealname());
			model.addAttribute("shopname", tempSysUser.getShopname());
			
			if(("2".equals(tempSysUser.getUsertype()) || "3".equals(tempSysUser.getUsertype()) )&& passWord.equals(tempSysUser.getPassword())){
				return "showadmin";//管理员操作页面				
			}else if("1".equals(tempSysUser.getUsertype()) && passWord.equals(tempSysUser.getPassword())){
				return "showseller"; //用户操作页面	
			}else{
				return "login";
			}
			/*if("sysadmin".equals(tempSysUser.getLogincode()) && passWord.equals(tempSysUser.getPassword())){
				return "showadmin";//管理员操作页面				
			}else if(!"sysadmin".equals(tempSysUser.getLogincode()) && passWord.equals(tempSysUser.getPassword())){
				return "showseller"; //用户操作页面				
			}else{
				return "login";
			}*/
			//登录日志需插入日志，方便统计！
			//user1.setLastLogTime(new Date());
			//this.userService.update(user1);
		} catch(Exception ex){
			System.out.print("Error:"+ex.getMessage());
			logger.info(ex.getMessage());
		}
		return "login";
	}
	/**
	 * 退出登录
	 * @param sq
	 * @return
	 */
	@RequestMapping(value = {"/logout"}, method = {RequestMethod.GET})
	public String logout(HttpServletRequest sq) {		 
		return "login";
	}
	/**
	 * 修改登录密码
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "editPwdPage" }, method = { RequestMethod.GET })
	public String editPwdPage(Model model) {
		return "editpwdpage";
	}
	
	
	
	//----------------------
	@RequestMapping(value = {"userPage"}, method = {RequestMethod.GET})
	public String userPage(Integer pageNo, Integer pageSize, String userName, Model model) {
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("username", userName);
		return "userpage";
	}
	@RequestMapping(value = {"integral"}, method = {RequestMethod.GET})
	public String integral(Integer pageNo, Integer pageSize, Model model) {
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageSize", pageSize);
		return "integral-list";
	}
}

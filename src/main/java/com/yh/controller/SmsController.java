package com.yh.controller;

import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.yh.model.MemberInfo;
import com.yh.model.SysUser;
import com.yh.service.MemberService;
import com.yh.service.SysUserService;
import com.yh.utils.SmsCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@RestController
@RequestMapping("/sms")
public class SmsController {
    private static final Logger logger = LoggerFactory.getLogger(ShopOrderController.class);

    @Resource
    private SysUserService sysUserService;
    /**
     * 发送短信
     * @param phonenum
     * @return
     */
    @RequestMapping("/sendMsg/{phonenum}")
    public Object sendMsg(@PathVariable(name ="phonenum") String phonenum){
        ResultInfo<Map<String,Object>> resultInfo = new ResultInfo<>();
        try{
            if(phonenum.trim().length()!=11){
                resultInfo.setCode(ResultEnum.FAILED.getCode());
                resultInfo.setInfo(ResultEnum.FAILED.getInfo());
                return resultInfo;
            }
            SysUser sysUser=new SysUser();
            sysUser.setPhonenum(phonenum);
            List<SysUser> sysUserList=sysUserService.getSysUserList(sysUser);
            		if(sysUserList==null || sysUserList.size()<1) {
            	 resultInfo.setCode(ResultEnum.FAILED.getCode());
                 resultInfo.setInfo("该用户手机号不存在");
                 return resultInfo;
            }
            //将hash值和tamp时间返回给前端
            Map<String, Object> map = SmsCode.sendMsg(phonenum);
            resultInfo.setData(map);
            if(map!=null) {
                resultInfo.setCode(ResultEnum.SUCCESS.getCode());
                resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
            }else{
                resultInfo.setCode(ResultEnum.FAILED.getCode());
                resultInfo.setInfo(ResultEnum.FAILED.getInfo());
            }
        }catch (Exception ex){
            ex.fillInStackTrace();
            logger.error(ex.getMessage());
            resultInfo.setCode(ResultEnum.FAILED.getCode());
            resultInfo.setInfo(ResultEnum.FAILED.getInfo());
        }
        return resultInfo;
    }
}

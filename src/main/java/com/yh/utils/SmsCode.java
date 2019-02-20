package com.yh.utils;


import com.alibaba.fastjson.JSON;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.yh.model.MemberInfo;
import com.yh.model.SysUser;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import com.aliyuncs.exceptions.ClientException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SmsCode {
    private static final Logger logger = LoggerFactory.getLogger(SmsCode.class);
    // KEY为生成短信验证码所需的自定义秘钥
    public static final String SMS_KEY = "3_YOU_6HU_0";
    /**
     * 短信验证码判断前后端是否一致
     * @param memberInfo
     * @return
     */
    public static int validateSmsCode(SysUser memberInfo) {
        String requestHash = memberInfo.getHash();
        String tamp = memberInfo.getTamp();
        String msgNum = memberInfo.getSmscode();
        String hash = MD5.md5(SMS_KEY + "@" + tamp + "@" + msgNum);
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        if (tamp.compareTo( sdf.format(dt)) > 0) {
            if (hash.equalsIgnoreCase(requestHash)){
                //校验成功
                return 1;
            }else {
                //验证码不正确，校验失败
                return 0;
            }
        } else {
            // 超时
            return -1;
        }
    }
    /**
     * 发送短信
     * @param phoneNumber
     * @return @RequestBody Map<String,Object> requestMap
     */
    public static Map<String, Object> sendMsg(String phoneNumber) {
        //String phoneNumber = requestMap.get("phonenum").toString();
        String randomNum = MD5.createRandomNum(6);// 生成随机数
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MINUTE, 5);
        String currentTime = sf.format(c.getTime());// 生成5分钟后时间，用户校验是否过期
        Map<String, Object> resultMap = new HashMap<>();
        try {
        	System.out.println(randomNum);
             sendSms(phoneNumber, randomNum); //此处执行发送短信验证码方法
            String hash = MD5.md5(SmsCode.SMS_KEY + "@" + currentTime + "@" + randomNum);//生成MD5值
            resultMap.put("hash", hash);
            resultMap.put("tamp", currentTime);
        }catch (Exception ex){
            logger.debug(ex.getMessage());
            ex.fillInStackTrace();
        }
        return resultMap; //将hash值和tamp时间返回给前端
    }

    //产品名称:云通信短信API产品,开发者无需替换
    static final String product = "Dysmsapi";
    //产品域名,开发者无需替换
    static final String domain = "dysmsapi.aliyuncs.com";

    // TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
    static final String accessKeyId = "LTAIP19n13nqLS4o";
    static final String accessKeySecret = "NJEpwyUnX84vREvFNwFOIDaButqwWn";
    //throws ClientException
    public static SendSmsResponse sendSms(String phoneNumber,String randomNum)  throws ClientException{

        //可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象-具体描述见控制台-文档部分内容
        SendSmsRequest request = new SendSmsRequest();
        //必填:待发送手机号
        request.setPhoneNumbers(phoneNumber);
        //必填:短信签名-可在短信控制台中找到
        request.setSignName("油虎车服");
        //必填:短信模板-可在短信控制台中找到
        request.setTemplateCode("SMS_151548433");
        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        //request.setTemplateParam("{ \"smscode\":"+randomNum+"}");
        //request.setTemplateParam("{\"name\":\"Tom\", \"smscode\":\"666666\"}");
        request.setTemplateParam("{\"smscode\":\"" + randomNum + "\"}");

        //选填-上行短信扩展码(无特殊需求用户请忽略此字段)
        //request.setSmsUpExtendCode("90997");

        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        //request.setOutId("yourOutId");

        //hint 此处可能会抛出异常，注意catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        //System.out.println("短信接口返回的数据----------------");
        //System.out.println("Code=" + sendSmsResponse.getCode());
        //System.out.println("Message=" + sendSmsResponse.getMessage());
        //System.out.println("RequestId=" + sendSmsResponse.getRequestId());
        //System.out.println("BizId=" + sendSmsResponse.getBizId());
        logger.info(JSON.toJSONString(sendSmsResponse));
        return sendSmsResponse;
    }

    public static QuerySendDetailsResponse querySendDetails(String bizId) throws ClientException {

        //可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象
        QuerySendDetailsRequest request = new QuerySendDetailsRequest();
        //必填-号码
        request.setPhoneNumber("15000000000");
        //可选-流水号
        request.setBizId(bizId);
        //必填-发送日期 支持30天内记录查询，格式yyyyMMdd
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMdd");
        request.setSendDate(ft.format(new Date()));
        //必填-页大小
        request.setPageSize(10L);
        //必填-当前页码从1开始计数
        request.setCurrentPage(1L);

        //hint 此处可能会抛出异常，注意catch
        QuerySendDetailsResponse querySendDetailsResponse = acsClient.getAcsResponse(request);

        return querySendDetailsResponse;
    }
}

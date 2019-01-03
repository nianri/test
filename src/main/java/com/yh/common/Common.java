package com.yh.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class Common {
	//private static final Log logger = LogFactory.getLog(common.class);
	 
	
	/**
	 * 当前日期
	 * @return
	 * @throws ParseException 
	 */
	public static String GetNowDate() throws ParseException{  
		//最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
	    Date dt = new Date(); 
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    
	    //return sdf.parse(sdf.format(dt));
	    return sdf.format(dt);
	}	
	/**
	 * 生成UUID
	 * @return
	 */
	public static String createUUid() {
		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		return id.toLowerCase().replaceAll("-", "");
	}
	/**
     * 根据当前时间戳生成排序数值
     * @return
     */
    public static String getRandomIndex(){
        return String.valueOf(System.currentTimeMillis()+ new Random().nextInt(1000));
    }
	public static HttpSession getSession() { 
	    HttpSession session = null; 
	    try { 
	        session = getRequest().getSession(); 
	    } catch (Exception e) {} 
	        return session; 
	}	    
	public static HttpServletRequest getRequest() { 
	    ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes(); 
	    return attrs.getRequest(); 
	}	
	/**
	 * 获取当前用户店铺ID
	 * @return
	 */
	public static String getCurrentUserShopId(){
		//System.out.println("ShopID:>"+getSession().getAttribute("shopid").toString());
		return getSession().getAttribute("shopid").toString();
	}
}

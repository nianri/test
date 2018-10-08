package com.yh.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class common {
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

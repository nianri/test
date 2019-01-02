package com.yh.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SysIntercptor implements HandlerInterceptor {
	private static final Log logger = LogFactory.getLog(SysIntercptor.class);
	@Override
    public boolean preHandle(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse, Object o) throws Exception {
        //System.out.println("拦截器启动！");
        try{
        	if("".equals(Common.getSession().getAttribute("userid").toString())||
            		Common.getSession().getAttribute("userid").toString()==null){
            	return false;
            }else
            	return true;
        }catch(Exception ex){
        	logger.info(ex.getMessage());
        	return false;
        }
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //System.out.println("Interceptor1....postHandle");
    }
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //System.out.println("Interceptor1....afterCompletion");
    }
}

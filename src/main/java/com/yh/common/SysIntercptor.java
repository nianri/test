package com.yh.common;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SysIntercptor implements HandlerInterceptor {
	private static final Log logger = LogFactory.getLog(SysIntercptor.class);
	private static final PathMatcher pathMatcher = new AntPathMatcher();

	/**
     * List中的地址无需Token验证！
     */
    private static List<String> unTokeUrlList = Arrays.asList("/sms/sendMsg/**","/other" );
    //我们只对地址 /api 开头的api检查jwt. 不然的话登录/login也需要jwt
    private boolean isProtectedUrl(HttpServletRequest request) {
        //return pathMatcher.match("/api/**", request.getServletPath());
        for (String loop : this.unTokeUrlList) {
            if(pathMatcher.match(loop, request.getServletPath())){
                return false;
            }else{
                return true;
            }
        }
        return false;
    }
	@Override
    public boolean preHandle(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse, Object o) throws Exception {
        //System.out.println("拦截器启动！");
        try{
        	if(isProtectedUrl(httpServletRequest)){
        		if("".equals(Common.getSession().getAttribute("userid").toString())||
                		Common.getSession().getAttribute("userid").toString()==null){
                	return false;
                }else
                	return true;
        	}else{
        		return true;
        	}
        	
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

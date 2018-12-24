package com.yh.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration  
@PropertySource(value="classpath:jdbc.properties")      
public class ImgConfig{      
	@Value("${uploadImgService.Url}")   
	public  String uploadImgService;     
       
	//@Value("${viewImgService.Url}")   
	//public  String viewImgService;   
}  
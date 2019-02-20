package com.yh.controller;

import com.alibaba.fastjson.JSON;
import com.yh.common.ResultEnum;
import com.yh.common.ResultInfo;
import com.yh.utils.AliyunOSSUtil;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/upload")
public class UploadController {
    private final org.slf4j.Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 文件上传
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadBlog" ,method = RequestMethod.POST)
    public @ResponseBody Object uploadBlog(HttpServletRequest request,HttpServletResponse response) throws Exception {
    	//response.setHeader("Access-Control-Allow-Origin","*");
    	ResultInfo<Map<String,Object>> resultInfo = new ResultInfo<>();
    	try {
	    	request.setCharacterEncoding("UTF-8");
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	        /** 页面控件的文件流* */
	        MultipartFile multipartFile = null;
	        Map map =multipartRequest.getFileMap();
	        logger.info(JSON.toJSONString(multipartRequest.getFileMap()));
	        for (Iterator i = map.keySet().iterator(); i.hasNext();) {
	        	Object obj = i.next();
	        	multipartFile=(MultipartFile) map.get(obj);
	        }
        	 /** 获取文件的后缀* */
            String filename = multipartFile.getOriginalFilename();
            logger.info(filename);
            File newFile = new File(filename);
            FileOutputStream os = new FileOutputStream(newFile);
            os.write(multipartFile.getBytes());
            os.close();
            multipartFile.transferTo(newFile);
            String uploadUrl = AliyunOSSUtil.upload(newFile);
            if(uploadUrl!=null&&!"".equals(uploadUrl)) {
                Map<String, Object> map1  = new HashMap<>();
                map1.put("filePath",uploadUrl);
                resultInfo.setData(map1);
                resultInfo.setCode(ResultEnum.SUCCESS.getCode());
                resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
            }else{
            	resultInfo.setCode(ResultEnum.FAILED.getCode());
                resultInfo.setInfo(ResultEnum.FAILED.getInfo());
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultInfo.setCode(ResultEnum.FAILED.getCode());
            resultInfo.setInfo(ResultEnum.FAILED.getInfo());
        }
        return resultInfo;
    }
    
    @RequestMapping(value = "uploadBlog1", method = RequestMethod.POST)
    public @ResponseBody Object  uploadBlog1( MultipartFile file) {
        logger.info("============>文件上传");
        if(file==null) logger.info(" file is null");
        ResultInfo<Map<String,Object>> resultInfo = new ResultInfo<>();
        try {
            if (null != file) {
                String filename = file.getOriginalFilename();
                if (!"".equals(filename.trim())) {
                    File newFile = new File(filename);
                    FileOutputStream os = new FileOutputStream(newFile);
                    os.write(file.getBytes());
                    os.close();
                    file.transferTo(newFile);
                    //上传到OSS
                    String uploadUrl = AliyunOSSUtil.upload(newFile);
                    System.out.println(uploadUrl);
                    if(uploadUrl!=null&&!"".equals(uploadUrl)) {
                        Map<String, Object> map  = new HashMap<>();
                        map.put("filePath",uploadUrl);
                        resultInfo.setData(map);
                        resultInfo.setCode(ResultEnum.SAVE_SUCCESS.getCode());
                        resultInfo.setInfo(ResultEnum.SAVE_SUCCESS.getInfo());
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            resultInfo.setCode(ResultEnum.SAVE_FAILED.getCode());
            resultInfo.setInfo(ResultEnum.SAVE_FAILED.getInfo());
        }
        return resultInfo;
    }
    
    
    @RequestMapping(value = "/uploadBlog2" ,method = RequestMethod.POST)
    public @ResponseBody Object  uploadBlog2(HttpServletRequest request) throws IllegalStateException, IOException
    {
    	ResultInfo<Map<String,Object>> resultInfo = new ResultInfo<>();
        try{
        	
        
    	long  startTime=System.currentTimeMillis();
        logger.info("-------->1");
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        logger.info("-------->2");
        if(multipartResolver.isMultipart(request))
        {
        	 logger.info("-------->3");
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
           //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();
             
            while(iter.hasNext())
            {
            	logger.info("-------->4");
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                System.out.println(file);
                if(file!=null)
                {
                    //String path="D:/001"+file.getOriginalFilename();
                    //System.out.println(path);
                    //上传
                    //file.transferTo(new File(path));
                	String uploadUrl = AliyunOSSUtil.upload(new File(file.getOriginalFilename()));
                    System.out.println(uploadUrl);
                    if(uploadUrl!=null&&!"".equals(uploadUrl)) {
                        Map<String, Object> map  = new HashMap<>();
                        map.put("filePath",uploadUrl);
                        resultInfo.setData(map);
                        resultInfo.setCode(ResultEnum.SUCCESS.getCode());
                        resultInfo.setInfo(ResultEnum.SUCCESS.getInfo());
                    }
                }
            }
        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        } catch (Exception ex) {
            ex.printStackTrace();
            resultInfo.setCode(ResultEnum.FAILED.getCode());
            resultInfo.setInfo(ResultEnum.FAILED.getInfo());
        }
        return resultInfo; 
    }
    
    @RequestMapping(value = "toUploadBlog", method = RequestMethod.GET)
    public String toUploadBlog() {
        return "upload";
    }
    
}
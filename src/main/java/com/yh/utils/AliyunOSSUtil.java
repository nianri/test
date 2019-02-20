package com.yh.utils;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.CreateBucketRequest;
import com.aliyun.oss.model.PutObjectRequest;
import com.aliyun.oss.model.PutObjectResult;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class AliyunOSSUtil {
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AliyunOSSUtil.class);

    public static String upload(File file){
    	if(null == file){
            return null;
        }
        logger.info("=========>OSS文件上传开始："+file.getName());
        String endpoint=ConstantProperties.JAVA4ALL_END_POINT;
        String accessKeyId=ConstantProperties.JAVA4ALL_ACCESS_KEY_ID;
        String accessKeySecret=ConstantProperties.JAVA4ALL_ACCESS_KEY_SECRET;
        String bucketName=ConstantProperties.JAVA4ALL_BUCKET_NAME1;
        String fileHost=ConstantProperties.JAVA4ALL_FILE_HOST;

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = format.format(new Date());

        OSSClient ossClient  = new OSSClient(endpoint,accessKeyId,accessKeySecret);
        try {
            //容器不存在，就创建
            if(! ossClient.doesBucketExist(bucketName)){
                ossClient.createBucket(bucketName);
                CreateBucketRequest createBucketRequest = new CreateBucketRequest(bucketName);
                createBucketRequest.setCannedACL(CannedAccessControlList.PublicRead);
                ossClient.createBucket(createBucketRequest);
            }
            //创建文件路径
            String fileUrl = fileHost+"/"+(dateStr + "/" + UUID.randomUUID().toString().replace("-","")+"-"+file.getName());
            //上传文件
            PutObjectResult result = ossClient.putObject(new PutObjectRequest(bucketName, fileUrl, file));
            //设置权限 这里是公开读
            ossClient.setBucketAcl(bucketName,CannedAccessControlList.PublicRead);
            if(null != result){
                //logger.info("==========>OSS文件上传成功,OSS地址："+fileUrl);
                //https://youhu360image.oss-cn-beijing.aliyuncs.com

                System.out.println("OSS文件上传成功,OSS地址："+"https://"+bucketName+"."+endpoint+"/" + fileUrl );
                return "https://"+bucketName+"."+endpoint+"/" + fileUrl;
            }
        }catch (OSSException oe){
            logger.error(oe.getMessage());
        }catch (ClientException ce){
            logger.error(ce.getMessage());
        }finally {
            //关闭
            ossClient.shutdown();
        }
        return null;
    }
}

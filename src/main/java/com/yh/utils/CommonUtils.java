package com.yh.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.Map;

public class CommonUtils {
	 /**
     * map 转 Object
     * @param map
     * @param beanClass
     * @return
     */
    public static Object mapToObject(Map<String, Object> map, Class<?> beanClass)  {      
        if (map == null)     
            return null;      
        Object obj=null;
		try {
			obj = beanClass.newInstance();
		} catch (InstantiationException e) {
			 throw new RuntimeException(" 对象实例化失败",e);
		} catch (IllegalAccessException e) {
			throw new RuntimeException(" 对象实例化失败",e);
		}    
        BeanInfo beanInfo=null;
		try {
			beanInfo = Introspector.getBeanInfo(obj.getClass());
			 PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();      
		        for (PropertyDescriptor property : propertyDescriptors) {    
		            Method setter = property.getWriteMethod();      
		            if (setter != null) {    
		                setter.invoke(obj, map.get(property.getName()));     
		            }    
		        }    
		} catch(Exception e){
			throw new RuntimeException("map 转 object 失败 ",e);
		}    
        return obj;    
    }      
    
}

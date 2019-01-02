package com.yh.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

import com.yh.model.Shop;
import com.yh.model.ShopCheck;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//common.getSession().setAttribute("t1", "xxxx");
		//common.getSession().getAttribute("t1");
		
		//Calendar cal = Calendar.getInstance();
		//System.out.println(cal.get(Calendar.DAY_OF_WEEK));
		//System.out.println(dateToWeek("2018-10-05"));
		/*ShopCheck shopCheck = new ShopCheck();
		shopCheck.setStatus("1");
		String strStatus=shopCheck.getStatus()=="1"?"2":"3";
		System.out.println("状态》"+strStatus);*/
	}
	public static String dateToWeek(String datetime) {        
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		Calendar cal = Calendar.getInstance(); 
		// 获得一个日历        
		Date datet = null;        
		try {            
			datet = f.parse(datetime);
			cal.setTime(datet);
		} catch (ParseException e) { 
			e.printStackTrace(); 
		}        
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1; 
		// 指示一个星期中的某天。        
		if (w < 0)  w = 0;        
		return weekDays[w];
	}
}

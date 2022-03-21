package com.sumin.spring.util;

import java.text.SimpleDateFormat;
import java.util.Date;


public class DateFormatter {
	
	SimpleDateFormat simpleDateFormat; 

	public DateFormatter() {
		this.simpleDateFormat = new SimpleDateFormat();
	}

	public String dateToString(Date date, String format) {
		String strDate;
		try {
			simpleDateFormat.applyPattern(format);
			strDate = simpleDateFormat.format(date);
		}catch (Exception e) { 
			e.printStackTrace();
			strDate = "err";
		}

		return strDate; 
	}
	
	public Date stringToDate(String strDate, String format) {
		Date date=null;
		try {
			simpleDateFormat.applyPattern(format);
			date = simpleDateFormat.parse(strDate);
		} catch(Exception e) {
			e.printStackTrace();
		}
        return date;
	}	
	public String changeFormat(String strDate, String beforeFormat, String afterFormat) {
		Date date = stringToDate(strDate, beforeFormat);
		String newDate = dateToString(date, afterFormat);
		return newDate;
	}
	
	
}

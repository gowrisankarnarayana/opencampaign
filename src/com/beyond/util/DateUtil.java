package com.beyond.util;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import com.beyond.base.vo.DateVO;
 

public final class DateUtil implements Serializable {

 	private static final long serialVersionUID = 1L;
 	public static String[] monthName = {" ","JAN", "FEB",
            "MAR", "APR", "MAY", "JUN", "JUL",
            "AUG", "SEP", "OCT", "NOV",
            "DEC"
        };
 	public static String[] weekName = {" ","MON", "TUE",
        "WED", "THU", "FRI", "SAT", "SUN"
    };
	public static java.sql.Date getSQLDate(String strDate, String strFormat)throws Exception{
	 
        if(strDate==null || strDate.equals("")){
        	return null;
        }           

        SimpleDateFormat sf= new SimpleDateFormat(strFormat);//"dd/MM/yyyy" or MM/dd/yyyy
	    java.util.Date tDate=sf.parse(strDate);
	    java.sql.Date sqlDate= new java.sql.Date(tDate.getTime());
 
	    return  sqlDate; 
	}
	
	public static DateVO getStringAsDateVO(String date)throws Exception {
		//ApplicationConstants.DATE_FORMAT;
		Logger.info("DateUtil.getStringAsDateVO " + date);
		DateVO vo=new DateVO();
		try{
			String tmp[] =date.split("/");
			int m= Integer.valueOf(tmp[0]);
			int d=  Integer.valueOf(tmp[1]);
			int y=  Integer.valueOf(tmp[2]);
			vo.setNumDay(d);
			vo.setNumMonth(m);
			vo.setNumYear(y);
		}catch(Exception e){
			throw new Exception("Invalid date format. Expecting MM/dd/yyyy");
		}
		
		return vo;
	}
	 
	public static java.sql.Timestamp getSQLTimeStamp(DateVO vo) throws Exception{
		 
	    Calendar calendar = new GregorianCalendar();
	    
		    calendar.set(Calendar.YEAR, vo.getNumYear());
		    calendar.set(Calendar.MONTH, vo.getNumMonth());
		    calendar.set(Calendar.DATE, vo.getNumDay());
		    calendar.set(Calendar.HOUR_OF_DAY, vo.getNumHours());
		    calendar.set(Calendar.MINUTE, vo.getNumMinutes());
		    calendar.set(Calendar.SECOND, 0);
		    calendar.set(Calendar.MILLISECOND, 0);
	    
	    return new Timestamp(calendar.getTimeInMillis());
	}
	
	public static java.sql.Timestamp getCurrentTime() throws Exception{
		return new Timestamp(System.currentTimeMillis());
	}
	public static long getCurrentTimeMillis(){
		return System.currentTimeMillis();
	}
	public static java.sql.Date getDate(){ 
        return new java.sql.Date(new java.util.Date().getTime());
    }
	 
	public static java.util.Date getStringAsUtilDate(String strDate, String strFormat)throws Exception{
			 
	        if(strDate==null || strDate.equals("")){
	        	return null;
	        }           

	        SimpleDateFormat sf= new SimpleDateFormat(strFormat);//"dd/MM/yyyy" or MM/dd/yyyy
		    java.util.Date tDate=sf.parse(strDate);
		   
		    return  tDate; 
		}
	public static String getSQLDateAsString(Date date, String strFormat) 
    {
	  SimpleDateFormat dateFormatter = new SimpleDateFormat(strFormat); //"dd/MM/yyyy"
      String strDate=null;
      if(date!=null){
        strDate= dateFormatter.format(date);
      }
      return strDate;
    }
	
	public static Timestamp getSQLTime(int hours,int minutes, int ampm){
		Calendar calendar = new GregorianCalendar();
		    calendar.set(Calendar.HOUR_OF_DAY, hours);
		    calendar.set(Calendar.MINUTE, minutes);
		    calendar.set(Calendar.SECOND, 0);
		    calendar.set(Calendar.MILLISECOND, 0);
		    calendar.set(Calendar.AM_PM, ampm);		    
	    return new Timestamp(calendar.getTimeInMillis());
	}	  
	
}

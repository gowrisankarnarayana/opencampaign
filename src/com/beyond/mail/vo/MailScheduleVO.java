/**
 * 
 */
package com.beyond.mail.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;

import com.beyond.base.vo.BaseVO;
import com.beyond.base.vo.DateVO;
import com.beyond.constants.MailConstants;
import com.beyond.mail.MailScheduler;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

/**
 * @author gowrisankar.narayana
 *
 */
public class MailScheduleVO extends BaseVO implements Serializable{
	 
	private static final long serialVersionUID = 6445391967466890710L;
	
	/*Below attributes are common for all Delivery Patterns */
	private long mailerId;
	private int  deliveryPatternId=0;
	private long mailscheduleId;
	
	private Timestamp deliveryTime;
	private int  sendHours;
 	private int  sendMinutes;
 	private int  sendAmPm;
 	
	private String startDate;
	private String endDate;
	private boolean excludeHolidays=true;
	private boolean autoRoll=true;
		
	/*Daily Pattern*/
	private int[] daysExcluded;

	/*Weekly Pattern*/
	private int dayOfWeek;
	
	/*Monthly Pattern*/
	private int dateOfMonth;
			
	/*Hmm.. not using these attributes yet*/
	private int delivery_status;
	private Date nextDelivery;
	
	public MailScheduleVO(){}
	
 	public long getMailscheduleId() {
		return mailscheduleId;
	}

	public void setMailscheduleId(long mailscheduleId) {
		this.mailscheduleId = mailscheduleId;
	}
	public int getDeliveryPatternId() {
		return deliveryPatternId;
	}
	public void setDeliveryPatternId(int deliveryPatternId) {
		this.deliveryPatternId = deliveryPatternId;
	}
	 
	 
	public boolean isExcludeHolidays() {
		return excludeHolidays;
	}
	public void setExcludeHolidays(boolean excludeHolidays) {
		this.excludeHolidays = excludeHolidays;
	}
	public boolean isAutoRoll() {
		return autoRoll;
	}
	public void setAutoRoll(boolean autoRoll) {
		this.autoRoll = autoRoll;
	}
	public int[] getDaysExcluded() {
		return daysExcluded;
	}
	public void setDaysExcluded(int[] daysExcluded) {
		this.daysExcluded = daysExcluded;
	}
	public int getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public int getDateOfMonth() {
		return dateOfMonth;
	}
	public void setDateOfMonth(int dateOfMonth) {
		this.dateOfMonth = dateOfMonth;
	}
	public int getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(int deliveryStatus) {
		delivery_status = deliveryStatus;
	}
	public Date getNextDelivery() {
		return nextDelivery;
	}
	public void setNextDelivery(Date nextDelivery) {
		this.nextDelivery = nextDelivery;
	}

	public int getSendHours() {
		return sendHours;
	}

	public void setSendHours(int sendHours) {
		this.sendHours = sendHours;
	}

	public int getSendMinutes() {
		return sendMinutes;
	}

	public void setSendMinutes(int sendMinutes) {
		this.sendMinutes = sendMinutes;
	}

	public int getSendAmPm() {
		return sendAmPm;
	}

	public void setSendAmPm(int sendAmPm) {
		this.sendAmPm = sendAmPm;
	} 
	 
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MailScheduleVO [autoRoll=");
		builder.append(autoRoll);
		builder.append(", dateOfMonth=");
		builder.append(dateOfMonth);
		builder.append(", dayOfWeek=");
		builder.append(dayOfWeek);
		builder.append(", daysExcluded=");
		builder.append(Arrays.toString(daysExcluded));
		builder.append(", deliveryPatternId=");
		builder.append(deliveryPatternId);
		builder.append(", deliveryTime=");
		builder.append(deliveryTime);
		builder.append(", delivery_status=");
		builder.append(delivery_status);
		builder.append(", endDate=");
		builder.append(endDate);
		builder.append(", excludeHolidays=");
		builder.append(excludeHolidays);
		builder.append(", nextDelivery=");
		builder.append(nextDelivery);
		builder.append(", sendAmPm=");
		builder.append(sendAmPm);
		builder.append(", sendHours=");
		builder.append(sendHours);
		builder.append(", sendMinutes=");
		builder.append(sendMinutes);
		builder.append(", startDate=");
		builder.append(startDate);
		builder.append("]");
		return builder.toString();
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Timestamp getDeliveryTime() {
		if(!(deliveryTime==null)){
			return deliveryTime;
		}else{
			return DateUtil.getSQLTime(sendHours, sendMinutes, sendAmPm);
		}
	}

	public void setDeliveryTime(Timestamp deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

 
	
	/* Constructs valid cron expressions for recurring schedules
	 * Known Issues :
	 * 1. 10.00 AM 2nd Of Every Month NOV-2009 to FEB-2010
	 *    Results in [ 0 0 10 2 NOV-FEB 2009-2010 ]
	 *    CRON tab throws error because NOV-FEB is not a valid month range  
	 * */
	public String getCronExpression() throws Exception{
		
	/* CRON Expression 
	 * FORMAT : SECONDS MINUTES HOURS DATE_OF_MONTH MONTH_NAME DAY_NUM_OF_WEEK YEAR
	 */
		StringBuilder sb=new StringBuilder();
		DateVO d1=DateUtil.getStringAsDateVO(startDate);
		
		DateVO d2=new DateVO();
		if(endDate!=null && !endDate.isEmpty()){
			d2=DateUtil.getStringAsDateVO(endDate);
		}
		
		 sb.append("0").append(" "); 		 								  //Seconds
		 sb.append(sendMinutes).append(" "); 								  //Minutes
		 sb.append(sendHours).append(" ");   								  //Hours
		 
		switch(deliveryPatternId){ 
			case MailConstants.SEND_IMMEDIATE:
				 sb.append(d1.getNumDay()).append(" "); 		 			  //Date of Month
				 sb.append(DateUtil.monthName[d1.getNumMonth()]).append(" "); //Month Name
				 sb.append("?").append(" ");								  //Week Day Name
				 sb.append(d1.getNumYear()); 								  //Year
				 break; 
			case MailConstants.SEND_ONCE: 
				 sb.append(d1.getNumDay()).append(" "); 		 				  //Date of Month
				 sb.append(DateUtil.monthName[d1.getNumMonth()]).append(" "); //Month Name
				 sb.append("?").append(" ");								  //Week Day Name
				 sb.append(d1.getNumYear()); 								  //Year
 				 break; 
			case MailConstants.SEND_DAILY: 
				 sb.append("*").append(" "); 		 						  //Date of Month
				 sb.append(DateUtil.monthName[d1.getNumMonth()]).append("-"); //Start Month Name
				 sb.append(DateUtil.monthName[d2.getNumMonth()]).append(" "); //End Month Name
				 sb.append("?").append(" "); 		 						  //Week Day Name
				 sb.append(d1.getNumYear()); 								  //Start Year
				 sb.append("-");  
				 sb.append(d2.getNumYear());								  //End Year
				 break;
			case MailConstants.SEND_WEEKLY:
			 	 sb.append("?").append(" "); 		 						  //Date of Month
				 sb.append(d1.getNumMonth()).append("-");                     //Start Month Number
				 sb.append(d2.getNumMonth()).append(" "); 					  //End Month Number
				 sb.append(DateUtil.weekName[dayOfWeek]).append(" "); 		  //Week Day Name
				 sb.append(d1.getNumYear()); 								  //Start Year
				 sb.append("-");  
				 sb.append(d2.getNumYear()); 								  //End Year
				 break;
			case MailConstants.SEND_MONTHLY:
			 	 sb.append(dateOfMonth).append(" "); 						  //Date of Month
				 sb.append(DateUtil.monthName[d1.getNumMonth()]).append("-"); //Start Month Name
				 sb.append(DateUtil.monthName[d2.getNumMonth()]).append(" "); //End Month Name
				 sb.append("?").append(" "); 		 						  //Week Day Name
				 sb.append(d1.getNumYear()); 								  //Start Year
				 sb.append("-");  
				 sb.append(d2.getNumYear()); 								  //End Year
		}
		
		Logger.info(sb.toString());
		return sb.toString().trim(); 
		
	} 
	public static void main(String a[]) throws Exception{
		
		MailScheduleVO v=new MailScheduleVO();
		v.setStartDate("04/24/2010");
		v.setEndDate("06/05/2010");
		v.setSendMinutes(00);
		v.setSendHours(11);
		v.setDayOfWeek(2); 
		v.setMailerId(10);
		v.setIdCreatedBy(8);
		
		v.setDeliveryPatternId(MailConstants.SEND_ONCE); 
		System.out.println(v.getCronExpression());
		 
		v.setDeliveryPatternId(MailConstants.SEND_IMMEDIATE); 
		System.out.println(v.getCronExpression());
		
		v.setDeliveryPatternId(MailConstants.SEND_MONTHLY); 
		System.out.println(v.getCronExpression());
		
		v.setDeliveryPatternId(MailConstants.SEND_WEEKLY); 
		System.out.println(v.getCronExpression());
		
		v.setDeliveryPatternId(MailConstants.SEND_DAILY); 
		System.out.println(v.getCronExpression());
	   
		MailScheduler.scheduleJob(v);
	}

	public long getMailerId() {
		return mailerId;
	}

	public void setMailerId(long mailerId) {
		this.mailerId = mailerId;
	}
}

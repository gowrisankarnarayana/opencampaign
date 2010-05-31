package com.beyond.mail;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;

import com.beyond.constants.MailConstants;
import com.beyond.mail.vo.MailScheduleVO;
import com.beyond.util.Logger;

public class MailScheduler{ 
	
	private static SchedulerFactory schedFact =new StdSchedulerFactory();
    private static Scheduler sched=null; 
    
	  static{
        try{
			if(sched==null){
    	      sched = schedFact.getScheduler();
			 }
			  sched.start();
	   	   }catch (SchedulerException se) {
	   		   se.printStackTrace();
	   		   Logger.error(se.getMessage());
	    }
	  }  
	 
	  public static synchronized boolean scheduleJob(MailScheduleVO vo) throws Exception{
		 	String trigName = MailConstants.TRIGGER_PREFIX + vo.getMailerId();
			String jobName  = MailConstants.JOB_PREFIX + vo.getMailerId();
			String jobGroup = MailConstants.GROUP_PREFIX + vo.getIdCreatedBy();
			JobDetail job = new JobDetail(jobName,jobGroup, MailJob.class);
			Trigger trigger = new CronTrigger(trigName, jobGroup, jobName, jobGroup, vo.getCronExpression());
			java.util.Date rDate= sched.scheduleJob(job,trigger);
			 
			if(rDate==null){
				return false;
			}else{
				return true;
			} 
	  }
	  
	  public static synchronized boolean rescheduleJob(MailScheduleVO vo) throws Exception{
		  	String trigName = MailConstants.TRIGGER_PREFIX + vo.getMailerId();
			String jobName  = MailConstants.JOB_PREFIX + vo.getMailerId();
			String jobGroup = MailConstants.GROUP_PREFIX + vo.getIdCreatedBy();
			Trigger trigger = new CronTrigger(trigName, jobGroup, jobName, jobGroup, vo.getCronExpression());
			java.util.Date rDate= sched.rescheduleJob(trigName,jobGroup,trigger);
			
			if(rDate==null){
				return false;
			}else{
				return true;
			} 
	  }
	  
	  public static synchronized  boolean cancelJob(MailScheduleVO vo) throws Exception{
		   return cancelJob(vo.getIdCreatedBy(),vo.getMailerId());
	  }
	  
	  public static synchronized  boolean cancelJob(long userId,long mailerId) throws Exception{
		   	String jobName  = MailConstants.JOB_PREFIX + mailerId;
			String jobGroup = MailConstants.GROUP_PREFIX + userId; 
			return sched.deleteJob(jobName, jobGroup);			  
	  }
	  
}

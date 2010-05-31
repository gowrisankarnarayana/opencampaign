package com.beyond.mail;

import java.util.Date;

import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.beyond.util.Logger;

public class MailJob implements Job {

	@Override
	public void execute(JobExecutionContext ctx) throws JobExecutionException {
		JobDetail detail= ctx.getJobDetail();
		System.out.println("MailJob Is Executing");
		System.out.println(detail.getName());
		System.out.println("Mailer Id : " + getId(detail.getName()));
		System.out.println(detail.getGroup());
		System.out.println("User Id : " + getId(detail.getGroup()));
		System.out.println("Hello World Quartz Scheduler: " + new Date());		
		long userId=getId(detail.getGroup());
		long mailerId=getId(detail.getName());
		sendMail(userId, mailerId);
	} 
	private long getId(String arg0){
		String v=arg0.substring(arg0.lastIndexOf("_")+1);
		return Long.valueOf(v);
	}
	private void sendMail(long userId, long mailerId){
		try{
			Logger.info("MailJob Initiating MIMEMailer Thread For User:" + userId + " Mailer:" + mailerId);
			Thread r= new Thread(new MIMEMailer(userId,mailerId));
			r.start();
			Logger.info("MailJob Sucessfully Initiated MIMEMailer");
		}catch(Exception e){
			e.printStackTrace();
			Logger.error("JOB Execution ERROR : Could not send mailer Id :" + mailerId);
		}
	}
}

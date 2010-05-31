package com.beyond.mail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.beyond.constants.ApplicationConstants;
import com.beyond.mail.dao.MailDAO;
import com.beyond.mail.dao.impl.MailDAOImpl;
import com.beyond.mail.helper.ContentGenerator;
import com.beyond.mail.vo.MailVO;
import com.beyond.util.Logger;

/* Author - Gowrisankar.Narayan
 * 
 * Mail Dispatcher 
 * Runs every N seconds and thinks its a manager.
 * Because sleeps most of the time and when awake eats lot of memory. Duh :D
 * 
 * No proper error handling and propagation for most cases. This must be altered in
 * some point sooner.   
 * 
 * 1)Picks up all mails whose status is ScheduledForDelivery
 * 2)Constructs MailVO and transmits Templates to Actual Messages 
 * 3)Push mails into mail queue
 *  
 * */

public class MailDispatcher implements Runnable{
	
	List<MailVO> pendingMails=null;

	public MailDispatcher(){
		Logger.info("PROCESS : MailDispatcher is up and running");
	}
	@Override
	public void run() {
		try{
			
			/* Wake up lazy thread.. 
			 * and check to see if you have any useful work for your life */
			
			Logger.info("MailDispatcher checking for pending mails");
			
			while(hasMailsForDelivery()){
			
				Logger.info("MailDispatcher found some mails for delivery.. ");
				
				 /* If you have some mails for delivery then just push them all into MailQueue
				  * There are worker threads ready to take up jobs from the queue and do the needful.
				  * All you have to do is just push MailVO's to queue and get back to what you are good at.  
				  * */
				
					for(MailVO vo:pendingMails){
						try{
							Logger.info("Creating MIMEMailer thread for mailer id:" + vo.getMailerId());
							Thread mailer=  new Thread( new MIMEMailer(vo));
							mailer.start();
						}catch(Exception e){
							e.printStackTrace();
							Logger.error(e.getMessage());							
						}
					}
											
				Logger.info("MailDispatcher going for a small nap");
				Thread.sleep(ApplicationConstants.MAIL_DISPATCHER_SLEEP_TIME); 
				}
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
		}
		
	}
	
	private boolean hasMailsForDelivery() throws Exception{
		
		/*Start this is no good. Should change code to use JNDI Calls*/
			Logger.info("MailDispatcher: Establishing Connection with Database");
			
			String userName = ApplicationConstants.JDBC_USER_NAME;
	        String password = ApplicationConstants.JDBC_PASSWORD;
	        String url = ApplicationConstants.JDBC_URL;
	        Class.forName (ApplicationConstants.JDBC_DRIVER).newInstance ();
	        Connection conn = DriverManager.getConnection (url, userName, password);
	        
	        Logger.info("MailDispatcher: Sucessfully Connected to Database");
        /*End of this is no good*/

	    /*Connect to the Mail DAO and pickup all pending mails*/    
			MailDAO dao= new MailDAOImpl(conn);
			
			Logger.info("MailDispatcher: Finding mails due for delivery");
			
			pendingMails=new ArrayList<MailVO>(0);
			//pendingMails= dao.getPendingInstantMailers();
			
			/*Please Save Earth. Use resources sparingly.*/
			dao=null;
			if(conn!=null && !conn.isClosed()){
				conn.close();
			}
		
			if(pendingMails.size()>0){
			
			/* You have some mails to be delivered
			 * Use ContentGenerator and prepare actual messages in exchange of mail Templates
			 * Do forgot that all mail messages are templates. Even static mails, mails composed on the fly, 
			 * every thing and scrap is stored as a template. Dont ask why.*/	
			
				Logger.info("Scheduler found mails to be delivered");
				ContentGenerator cgen= new ContentGenerator();
				
				Logger.info("Calling content generator to construct mail messages");
				pendingMails=cgen.processMailers(pendingMails);
			
				return true;
				
			}else{
				Logger.info("MailDispatcher: Couldn't find any pending mails");
				return false;
				
			}
	}
	
	
	public static void main(String a[]){
	
		MailDispatcher s=new MailDispatcher();
		Thread producer= new Thread(s);
		producer.start();
		
	}
}

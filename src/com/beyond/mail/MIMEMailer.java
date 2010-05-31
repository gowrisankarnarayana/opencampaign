package com.beyond.mail;

import java.util.List;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.HtmlConstants;
import com.beyond.constants.MailConstants;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.mail.bo.MailBO;
import com.beyond.mail.helper.ContentGenerator;
import com.beyond.mail.vo.MailVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.BeyondError;
import com.beyond.util.Logger;
 
public class MIMEMailer implements Runnable{
   
	      private MailVO mailVO;
	      private MailBO bo;
	      
	      public MIMEMailer(long userId, long mailerId) throws Exception{
	    	  Logger.info("MIMEMailer(long userId, long mailerId) Initializing"); 
	    	  bo=new MailBO(new UserVO(userId));
	    	  mailVO= bo.getMailByMailerAndUserId(mailerId, userId);
	    	  mailVO.setUserId(userId);
	    	  prepareData();
	      }
	      
	      public MIMEMailer(final MailVO mailVO) throws Exception{
	    	   Logger.info("MIMEMailer(final MailVO mailVO) Initializing");
	    	   this.mailVO =mailVO;
	    	   bo=new MailBO(new UserVO(mailVO.getIdCreatedBy()));
	      } 
	      
	      private void prepareData(){
	    	  ContentGenerator cgen= new ContentGenerator();
	    	  mailVO=cgen.processMail(mailVO);
	      }
	      
	      private void addAttachments(Multipart multipart, List<DataSource> lstAttachments ) throws MessagingException, AddressException 
	      { 
				for(DataSource source: lstAttachments){
				MimeBodyPart attachmentBodyPart = new MimeBodyPart(); 
							 attachmentBodyPart.setDataHandler( new DataHandler(source) ); 
							 attachmentBodyPart.setFileName( source.getName()); 
				multipart.addBodyPart(attachmentBodyPart); 
				}
	      } 
	      
	      public void sendMails() throws Exception{
	    	    
	    	   	Logger.info("Entering MIMEMailer.sendMails :");
	    	   	Logger.info("Sending mails using below profile :");
	    	   	Logger.info(mailVO.getProperties().toString());
	    	   	
	    	   	Session session ;
			 	Multipart multipart=null;
				BodyPart body=null;
				Transport transport;
				
				   try{
					   
					   Logger.info("Obtaining Session and Transport");
		    		   
					   boolean debug = false;
		    		   java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		    	 	   session= Session.getDefaultInstance(mailVO.getProperties());
		    	 	   session.setDebug(debug);
		    		   transport= session.getTransport();
		    		   
		    	   }catch(Exception e){
		    		   
		    		   e.printStackTrace();
		    		   Logger.error("MIMEMailer: Unable to establish mail session - " + e.getMessage());
		    		   mailVO.setStatusId(MailConstants.DELIVERY_FAILED);
		    		   BeyondError errors=new BeyondError();
		    		   errors.addError(e.getMessage());
		    		   mailVO.setErrors(errors);
		    		   bo.updateMailerStatus(mailVO);
		    		   throw new Exception("Failed to establish mail session");
		    		   
		    	   }
				
		    	   try{
		    		   
		    		   	mailVO.setContactCount(mailVO.getContacts().size());
				    	
		    		   	for(CustomerVO contact:mailVO.getContacts()){ 
				    		
							Logger.info("Preparing mail session for : " + contact.getEmail());
						 				
							MimeMessage message = new MimeMessage(session);
							
							/*1.Set From Address */
							message.setSender(new InternetAddress(mailVO.getProperties().getProperty(ApplicationConstants.PROP_SMTP_USER), mailVO.getProperties().getProperty(ApplicationConstants.PROP_SMTP_FROM_NAME) ));
							
							/*2.Set To Address*/
							message.setRecipient(Message.RecipientType.TO, new InternetAddress(contact.getEmail()));
							
							/*3.Set Subject Line of Mail*/
							message.setSubject(mailVO.getStrSubject());
								
							/*4.Set Body/Content and Attachments*/	
							multipart=new MimeMultipart();
								body=new MimeBodyPart();
							    body.setContent(contact.getMailMessage() ,HtmlConstants.CONTENT_TEXT_HTML);
							    multipart.addBodyPart(body);
						    
							    if(mailVO.getLstAttachments().size()>0){
							    	addAttachments(multipart,mailVO.getLstAttachments());
							    }
						    
							Logger.info("1/4 Setting Mail Content");    
							message.setContent(multipart);
							
							Logger.info("2/4 Connecting transport");    
							transport.connect(mailVO.getProperties().getProperty(ApplicationConstants.PROP_SMTP_USER),mailVO.getProperties().getProperty(ApplicationConstants.PROP_SMTP_PASSWORD));
							
							Logger.info("3/4 Saving Changes");
				            message.saveChanges();
				               
				            Logger.info("4/4 Sending Message");
				            transport.sendMessage(message,message.getRecipients(Message.RecipientType.TO)); //,message.getRecipients(Message.RecipientType.TO));
				            
				            Logger.info("Closing Transport");
					        transport.close(); 	 
				            Logger.info("Mail Sent Sucessfully- MailerId:" + mailVO.getMailerId());  
			     		}
				    	
				    	 Logger.info("MIMEMailer updating mail status");
			    		 mailVO.setStatusId(MailConstants.DELIVERY_SUCCEDED);
			    		 bo.updateMailerStatus(mailVO); 
			    		 
		    	   }catch(Exception e){
		    		   mailVO.setStatusId(MailConstants.DELIVERY_FAILED);
		    		   BeyondError errors=new BeyondError();
		    		   errors.addError(e.getMessage());
		    		   mailVO.setErrors(errors);
		    		   bo.updateMailerStatus(mailVO);
		    		   e.printStackTrace();
		    		   Logger.error("Failed to send mail :" + mailVO.getMailerId());
		    		   throw new Exception("Failed to send mail");
		    	   } 
	      }

		@Override
		public void run(){
			 try{
				 sendMails();
			 }catch(Exception e){
				e.printStackTrace();
				Logger.error("MIMEMailer.run() " + e.getMessage()); 
			 }
		}

//		private class SMTPAuthenticator extends javax.mail.Authenticator {
//			Properties props=null;
//			public SMTPAuthenticator(Properties props) {
//			 this.props=props;
//			}
//			public PasswordAuthentication getPasswordAuthentication() {
//				String username = props.getProperty("mail.smtp.user");
//				String password = props.getProperty("mail.smtp.password");
//				return new PasswordAuthentication(username, password);
//			}
//		}
}
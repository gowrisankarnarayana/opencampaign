package com.beyond.mail.helper;

import java.util.List;

import sun.misc.BASE64Encoder;

import com.beyond.constants.HtmlConstants;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.mail.vo.MailVO;
import com.beyond.util.Logger;
import com.beyond.util.TemplateUtil;

public class ContentGenerator {

	private MailVO mailer;
	
	private static BASE64Encoder enc =new BASE64Encoder();

	public List<MailVO> processMailers(List<MailVO> mailers){
	
		List<MailVO> mails= mailers;
		
		try{
			Logger.info("ContentGenerator.processMailers() Generating content for multiple mailers");
			for(MailVO mvo:mails){
				this.mailer=mvo;
				constructMessages();
			}
			Logger.info("ContentGenerator.processMailers() Finished generating content for multiple mailers");
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
		}
		
	  return mails;
	}
	
	public MailVO processMail(MailVO mailer){
	this.mailer=mailer;
		try{
			Logger.info("ContentGenerator.processMailers() Generating content for single mailer");
			constructMessages();
			Logger.info("ContentGenerator.processMailers() Finished generating content");
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
		}
		
	  return this.mailer;
		
	}
	 
	public void constructMessages(){
		
		Logger.info("ContentGenetator.constructMessages()");
		
		for(CustomerVO contact:mailer.getContacts()){
		
			StringBuilder sbf=new StringBuilder();
			
			/* Mail tracker - track when the mail is opened */
			sbf.append(getMailTracker(contact));
			
			/* If user has chosen to show "web version" link*/
			if (mailer.isShowWebLink()){
				sbf.append(getWebLink(contact));
			}
			
			/* Append Message Header*/
			sbf.append(getMessageHeader(contact));
			
			/* Append message Body  */
			sbf.append(getMessageBody(contact));
			
			/* Append message Footer  */
			sbf.append(getMessageFooter(contact));
			
			/* Append link for users to unsubscribe from mailing list */
			sbf.append( getSubscription(contact));
			
			/* Set the constructed message*/
			contact.setMailMessage(sbf.toString());		
		
			Logger.info(sbf.toString());
		}
		
		Logger.info("Finished ContentGenetator.constructMessages()");
	}
	public String getMessageHeader(CustomerVO contact){
		StringBuilder headerHTML=new StringBuilder();
		
		headerHTML.append(HtmlConstants.HTML_FORM_HEADER);  
		headerHTML.append(" <INPUT type='hidden' name='tx' value='");
		headerHTML.append(mailer.getTemplateId()).append("' />");
		headerHTML.append(" <INPUT type='hidden' name='ex' value='");
		headerHTML.append(enc.encode(contact.getEmail().getBytes())).append("' />");
		headerHTML.append(" <INPUT type='hidden' name='cx' value='");
		headerHTML.append(contact.getCustomerId()).append("' />");
		headerHTML.append(" <INPUT type='hidden' name='mx' value='");
		headerHTML.append(mailer.getMailerId()).append("' />");
		headerHTML.append(" <INPUT type='hidden' name='ux' value='");
		headerHTML.append(mailer.getIdCreatedBy()).append("' />");
		headerHTML.append(" <INPUT type='hidden' name='lx' value='");
		headerHTML.append(contact.getGroupId()).append("' />");
		return headerHTML.toString();
	}
	public String getMessageFooter(CustomerVO contact){
		StringBuilder footerHTML=new StringBuilder();
		
		footerHTML.append("</FORM>");
	
		return footerHTML.toString();
	}
	
	public String getMailTracker(CustomerVO contact){
		StringBuilder sbf=new StringBuilder();
		
		sbf.append("<img height='0' width='0' src='");		
		sbf.append("http://188.222.201.58:8181/beyondcontact/t?");
		sbf.append("tx=").append(mailer.getTemplateId());
		sbf.append("&ex=").append(enc.encode(contact.getEmail().getBytes()));
		sbf.append("&mx=").append(mailer.getMailerId());
		sbf.append("&cx=").append(contact.getCustomerId());
		sbf.append("&ux=").append(mailer.getUserId());
		sbf.append("&lx=").append(contact.getGroupId());
		sbf.append("' />");
		
		return sbf.toString();
	}

	public String getWebLink(CustomerVO contact){
		StringBuilder sbf=new StringBuilder();
		
		sbf.append("<div style='margin:0px auto;width:100px;font-size:8pt;color:gray;font-family:Tahoma'><a href='http://188.222.201.58:8181/beyondcontact/v?");
		sbf.append("tx=").append(mailer.getTemplateId());
		sbf.append("&ex=").append(enc.encode(contact.getEmail().getBytes()));
		sbf.append("&mx=").append(mailer.getMailerId());
		sbf.append("&cx=").append(contact.getCustomerId());
		sbf.append("&ux=").append(mailer.getUserId());
		sbf.append("&lx=").append(contact.getGroupId());
		sbf.append("'>");
		sbf.append("Web version");
		sbf.append("</a></div>");
		
		return sbf.toString();		
	}

	public String getMessageBody(CustomerVO contact){
		Logger.info("Preparing MessageBody : ");
		StringBuilder sbf=new StringBuilder();
		sbf.append(TemplateUtil.decodeMessage(contact,mailer.getStrMessage()));
		return sbf.toString();
	}
	
	public String getSubscription(CustomerVO contact){
		StringBuilder sbf=new StringBuilder();
		sbf.append("<div style='margin:0px auto;width:400px;font-size:8pt;color:gray;font-family:Tahoma'><a href='");
		sbf.append("http://188.222.201.58:8181/beyondcontact/unsubscribe?");
		sbf.append("tx=").append(mailer.getTemplateId());
		sbf.append("&ex=").append(enc.encode(contact.getEmail().getBytes()));
		sbf.append("&mx=").append(mailer.getMailerId());
		sbf.append("&cx=").append(contact.getCustomerId());
		sbf.append("&ux=").append(mailer.getUserId());
		sbf.append("&lx=").append(contact.getGroupId());
		sbf.append("'>Please click here if you no longer wish to receive messages.</a></div>");
		return sbf.toString();
	}
	
	public String getDesclaimer(){
		StringBuilder sbf=new StringBuilder();
		
		return sbf.toString();		
	 
	}
	
}

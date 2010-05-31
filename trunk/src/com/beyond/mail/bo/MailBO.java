/**
 * 
 */
package com.beyond.mail.bo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.beyond.base.bo.BaseBO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.MailConstants;
import com.beyond.constants.MessageConstants;
import com.beyond.constants.ValidationConstants;
import com.beyond.mail.MailScheduler;
import com.beyond.mail.cache.MailCache;
import com.beyond.mail.vo.MailDeliveryLogVO;
import com.beyond.mail.vo.MailScheduleVO;
import com.beyond.mail.vo.MailVO;
import com.beyond.template.bo.TemplateBO;
import com.beyond.template.vo.TemplateVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.BeyondError;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;
import com.mysql.jdbc.StringUtils;

/**
 * @author gowrisankar.narayan
 *
 */
public class MailBO extends BaseBO {
 
	
	/**
	 * @param userVO
	 * @throws Exception
	 */
	public MailBO(UserVO userVO) throws Exception {
		super(userVO); 
	}
    
	public String scheduleMail(MailVO vo) throws Exception{
		
	StringBuilder sbf=new StringBuilder();
	Logger.info("Begin MailBO.scheduleMail(MailVO)");
		
	try{
		
		/* Though there is a JS validation in the front end, 
		 * to ensure no fake data is submitted, we do a second round validation here */
		vo=validate(vo);
		if(vo.getErrors().hasErrors()){
		  Logger.info(vo.getErrors().toString());
		  return vo.getErrors().toString();
		}
		
		Logger.info("Validations succeded. Setting MailVO properties");
		setMailProperties(vo);
		
		/* If user has not chosen Default Template then create a new mail template
		 * using the message and subject in mailVO */
		
		if(!vo.isMailTemplate()){
			Logger.info("Creating a new mail template...");
			TemplateBO bo=new TemplateBO(userVO);
			TemplateVO tvo=new TemplateVO();
			tvo.setDynamic(0);
			tvo.setName(vo.getStrSubject());
			tvo.setContent(vo.getStrMessage());
			bo.createTemplate(tvo);
			Logger.info("Successfully created new mail template...");
			vo.setTemplateId(tvo.getTemplateId());
			vo.setTemplateName(tvo.getName());
		}
		
		/*Save Mailer*/
		Logger.info("Calling MailCache.doCreateMailer()");
	 	vo=MailCache.doCreateMailer(vo);
		
	 	/*Schedule Mailer*/
	 	Logger.info("Scheduling MailJob");
	 	if(MailScheduler.scheduleJob(vo.getMailScheduleVO())){
	 		sbf.append(MessageConstants.MAIL_SCHEDULE_SUCCEDED);	
	 	}else{
	 		vo.getErrors().addError(MessageConstants.MAIL_SCHEDULE_ERROR);	 		
	 	}
	 	 
		}catch(Exception e){  
			e.printStackTrace();
			Logger.error(e.toString());
			sbf.append(MessageConstants.MAIL_CREATION_ERROR).append(e.getMessage());			
		}
		
		Logger.info("Returning from MailBO.scheduleMail(MailVO)");
		
		return sbf.toString();
	}
	
	public void setMailProperties(MailVO vo) throws Exception{
	 
	 /* Below data is filled in by this method
	  * 1. User Information
	  * 2. Common Attributes like Created Date, RecordActive Etc 
	  * 3. Data that sould be auto populated
	  * */
		
		Logger.info("Setting base attributes");
		setBaseAttributes(vo);
		vo.setUserId(userVO.getId());
		vo.setStatusId(MailConstants.DELIVERY_SCHEDULED);
		
		
		/* 2.1 If Delivery Type is SEND_IMMEDIATE Then
		 *    Auto: startDate becomes todays date
		 *    Auto: deliveryTime becomes current time
		 */
		Logger.info("Checking if delivery type is send_immediate");
		if(vo.isSendImmediate()){
			
			Logger.info("Creating immediate delivery schedule");
			MailScheduleVO svo =new MailScheduleVO();
			
			svo.setDeliveryPatternId(MailConstants.SEND_IMMEDIATE);
			svo.setStartDate(DateUtil.getSQLDateAsString(DateUtil.getDate(),ApplicationConstants.DATE_FORMAT));

			Calendar c= new GregorianCalendar();
			svo.setSendHours(c.get(Calendar.HOUR_OF_DAY));
			svo.setSendMinutes(c.get(Calendar.MINUTE) + MailConstants.SCHEDULE_DELAY_MINUTES);
			 
			svo.setAutoRoll(true);
			svo.setDelivery_status(MailConstants.DELIVERY_SCHEDULED);	 
			
			setBaseAttributes(svo);
			
			vo.setMailScheduleVO(svo); 
			
		}else{
			
			//Convert 12 Hours Date to 24 Hours Date 
			MailScheduleVO svo=vo.getMailScheduleVO();
			
			if(svo.getSendAmPm()==2){
			   svo.setSendHours(svo.getSendHours()+12);
			}
			
			setBaseAttributes(svo);
		} 
 		
	}

	public MailVO validate(MailVO vo) throws Exception{
		
		/* MailVO - What is considered as valid data?
		 * 
		 * 1. User must have selected To-Address (aka To)
		 *    Mandatory : mailIds (or) groupIds or Both
		 * 
		 * 2. User must have selected a Delivery-Type (aka When)
		 * 		2.1 If Delivery Type is SEND_IMMEDIATE Then
		 *          Auto: startDate becomes todays date
		 *          Auto: deliveryTime becomes current time
		 *      2.2 If Delivery Type is SEND_LATER Then
		 *          User must have selected delivery pattern 
		 *          Mandatory : Just_Send_Once(10) (or) Reccurring_Delivery(0) [ deliveryInfo ]
		 *          2.2.1 If JUST_SEND_ONCE Then
		 *          	  User must have entered 
		 *          	  Mandatory : sendOnceDate AND sendOnceHours AND sendOnceMinutes AND sendOnceAmPm
		 *          2.2.2 If RECCURING_DELIVERY Then
		 *                User must have entered 
		 *                Mandatory : startDate AND endDate AND sendHours AND sendMinutes AND sendAmPm AND deliveryPatternId
		 *                Optional  : excludeHolidays , autoRoll
		 *                2.2.2.1 If DeliveryPatternId is DAILY(20) Then
		 *                        Optional : daysExcluded
		 *                2.2.2.2 If DeliveryPatternId is WEEKLY(30) Then        
		 *           			  Mandatory : dayOfWeek
		 *                2.2.2.3 If DeliveryPatternId is MONTHLY(40) Then
		 *                		  Mandatory : dateOfMonth
		 *                
		 * 3. User must have selected content type (aka what)
		 *      3.1 If Content Type is COMPOSE NOW then  
		 *          Auto: Create a mail template using the message entered by the user
		 *      3.2 If Content Type is EXISTING_MAIL_TEMPLATE then
		 *          Mandatory: templateId
		 *          
		 * 4. User must have selected SUBJECT
		 * 
		 * 5. User must have entered mail message 
		 *      Mandatory If: ContentType is COMPOSE NOW
		 */
		BeyondError errors= new BeyondError();
		MailScheduleVO svo= vo.getMailScheduleVO(); 
		
		Logger.info("Validating TO Address");
		
		if(vo.isSendToGroup()){
			if(vo.getGroupIds()==null || vo.getGroupIds().length==0){
				errors.add(ValidationConstants.TO_LIST_REQUIRED);
			}
		}else{
			if(StringUtils.isNullOrEmpty(vo.getStrToAddress())){
				errors.add(ValidationConstants.TO_ADDRESS_REQUIRED);
			}else{
				vo.setContactCount(vo.getStrToAddress().split(",").length);
			}
		}
		
		if(vo.getProfileId()<=0){
			errors.add(ValidationConstants.EMAIL_PROFILE_REQUIRED);
		}
		
		if(!vo.isSendImmediate()){ 
			
			Logger.info("User has chosen to send this mail later. Validating further data");
			
			switch(svo.getDeliveryPatternId()){
			case MailConstants.SEND_ONCE:
				Logger.info("Validating Send Once Date");
				if(StringUtils.isNullOrEmpty(svo.getStartDate())){
					errors.add(ValidationConstants.DELIVERY_DATE_REQUIRED);
				}
				break;
			case MailConstants.SEND_DAILY:
				Logger.info("Validating Daily Pattern StareDate and EndDate");				
				if(StringUtils.isNullOrEmpty(svo.getStartDate())){
					errors.add(ValidationConstants.START_DATE_REQUIRED);
				}
				if(StringUtils.isNullOrEmpty(svo.getEndDate())){
					errors.add(ValidationConstants.END_DATE_REQUIRED);
				}
				break;
			case MailConstants.SEND_WEEKLY:
				Logger.info("Validating Weekly Pattern");
				if(svo.getDayOfWeek()<=0){
					errors.add(ValidationConstants.WEEK_DAY_REQUIRED);
				}
				Logger.info("Validating StareDate and EndDate");				
				if(StringUtils.isNullOrEmpty(svo.getStartDate())){
					errors.add(ValidationConstants.START_DATE_REQUIRED);
				}
				if(StringUtils.isNullOrEmpty(svo.getEndDate())){
					errors.add(ValidationConstants.END_DATE_REQUIRED);
				}				
				break;
			case MailConstants.SEND_MONTHLY:
				Logger.info("Validating Monthly Pattern");
				if(svo.getDateOfMonth()<=0 || svo.getDateOfMonth()>31){
					Logger.info("Invalid Date User has entered : " + svo.getDateOfMonth());
					errors.add(ValidationConstants.MONTH_DAY_REQUIRED);
				}
				Logger.info("Validating StareDate and EndDate");				
				if(StringUtils.isNullOrEmpty(svo.getStartDate())){
					errors.add(ValidationConstants.START_DATE_REQUIRED);
				}
				if(StringUtils.isNullOrEmpty(svo.getEndDate())){
					errors.add(ValidationConstants.END_DATE_REQUIRED);
				}
				break;
			default:
				/*No delivery method is chosen. Must have selected SendOnce or Recurring Delivery*/
				Logger.info("No Delivery Info Is Selected (SendOnce or Reccuring Delivery)");
				errors.add(ValidationConstants.DELIVERY_PATTERN_REQUIRED);
				break;
			} 
			 
		}
		
		if(StringUtils.isNullOrEmpty(vo.getStrSubject())){
			errors.add(ValidationConstants.EMAIL_SUBJECT_MANDATORY);
		}
		
		if(StringUtils.isNullOrEmpty(vo.getStrMessage())){
			errors.add(ValidationConstants.EMAIL_MESSAGE_MANDATORY);
		}
		
		
		vo.setErrors(errors);
		
		return vo;		
	}
	
	public List<MailDeliveryLogVO> getDeliveryLogByUserId() throws Exception{
		Logger.info("Entering MailBO.getDeliveryLogByUserId()");
		List<MailDeliveryLogVO> delLog=new ArrayList<MailDeliveryLogVO>(0);
		try{ 
			delLog=MailCache.getDeliveryLogByUserId(userVO.getId());
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
			throw e;
		}
		Logger.info("Leaving MailBO.getDeliveryLogByUserId() :" + delLog.size());
		return delLog;
	}
	
	public List<MailVO> getMailsByUserId() throws Exception{
		Logger.info("Entering MailBO.getMailsByUserId()");
		List<MailVO> sentMails=new ArrayList<MailVO>(0);
		try{
			sentMails=MailCache.getMailersByUserId(userVO.getId());
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
			throw e;
		}
		Logger.info("Leaving MailBO.gerMailsByUserId() :" + sentMails.size());
		return sentMails;
	}
	
	public MailVO getMailByMailerAndUserId(long mailerId,long userId) throws Exception{
		Logger.info("Entering MailBO.getMailByMailerAndUserId");
		MailVO mailer=null;
		try{
			mailer= MailCache.getMailerByMailerAndUserId(mailerId, userId);
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
			throw e;
		}
		Logger.info("Leaving MailBO.getMailByMailerAndUserId");
		return mailer;
	}

	public void updateMailerStatus(MailVO vo) {
		Logger.info("Entering MailBO.updateMailerStatus");
		try{
			MailCache.updateMailerStatus(vo);
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
		}
		Logger.info("Leaving MailBO.updateMailerStatus");
	}
	
}

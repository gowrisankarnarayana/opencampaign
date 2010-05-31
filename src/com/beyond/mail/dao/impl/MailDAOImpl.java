/**
 * 
 */
package com.beyond.mail.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.beyond.base.dao.impl.BaseDAOImpl;
import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.MailConstants;
import com.beyond.customer.dao.CustomerDAO;
import com.beyond.customer.dao.impl.CustomerDAOImpl;
import com.beyond.mail.dao.MailDAO;
import com.beyond.mail.vo.MailDeliveryLogVO;
import com.beyond.mail.vo.MailPropertiesVO;
import com.beyond.mail.vo.MailScheduleVO;
import com.beyond.mail.vo.MailVO;
import com.beyond.mail.vo.ResponseVO;
import com.beyond.template.vo.ElementVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;
 
/**
 * @author gowri
 *
 */
public class MailDAOImpl extends BaseDAOImpl implements MailDAO {

 /**
  * @param conn
  * @throws SQLException
  */
 public MailDAOImpl(Connection conn) throws SQLException {
  super(conn);
  // TODO Auto-generated constructor stub
 }

 /* (non-Javadoc)
  * @see com.beyond.mail.dao.MailDAO#doCreateMailer(com.beyond.mail.vo.MailVO)
  */
 @Override
 public synchronized MailVO doCreateMailer(MailVO mailVO) throws SQLException {
  
  Logger.info("Entering into MailDAO.doCreateMailer(MailVO)");
   
  PreparedStatement pstmt = null;
  
  StringBuilder query = new StringBuilder();
  query.append(" insert into mailers (user_id,template_id,sent_on,status_id,");
  query.append(" CREATED_BY,CREATED_ON,MODIFIED_BY,MODIFIED_ON,IS_ACTIVE,");
  query.append(" mail_subject,group_ids,send_to_groups,profile_id) ");
  query.append(" VALUES(?,?,SYSDATE(),?,?,SYSDATE(),?,SYSDATE(),?,?,?,?,?)");
  
  Logger.info(query.toString());
  
  try {

   pstmt = getConnection().prepareStatement(query.toString());

   pstmt.setLong(1,  mailVO.getUserId());
   pstmt.setLong(2,  mailVO.getTemplateId());
   pstmt.setLong(3,  mailVO.getStatusId());
   pstmt.setLong(4,  mailVO.getIdCreatedBy());
   pstmt.setLong(5,  mailVO.getIdModifiedBy());
   pstmt.setInt(6,   mailVO.isActive()?1:0);
   pstmt.setString(7,mailVO.getStrSubject());
   pstmt.setString(8,StringUtils.join(mailVO.getGroupIds(),","));
   pstmt.setInt(9,   mailVO.isSendToGroup()?1:0);
   pstmt.setLong(10, mailVO.getProfileId());
   pstmt.execute();
      
   pstmt=getConnection().prepareStatement("select fun_getMaxMailerByUserId(?) as mailerId");
   pstmt.setLong(1,mailVO.getUserId());
   ResultSet rs= pstmt.executeQuery();
   
    while(rs.next()){
     mailVO.setMailerId(rs.getLong("mailerId"));
     Logger.info("New Mailer Id : " + mailVO.getMailerId());
    }
   
   rs.close();
   rs=null;

   /*Save Mail Contacts Only If contacts are selected. Otherwise just storing the groupId is fine*/
   if(!mailVO.isSendToGroup()){
	   Logger.info("MailDAO.doCreateMailer(MailVO) Custom Search Selected. Inserting data into MAILERS_CUSTOMERS");
	   doCreateMailCustomers(mailVO);
   }
   
   /*Schedule Mail*/
   doCreateMailSchedule(mailVO);
   
   Logger.info("MailDAO.doCreateMailer(MailVO) : Sucesfully Created Mailer");
   
   commitTransactions();
  } catch (Exception e) {
	  Logger.error(e.toString());
	  rollbackTransactions();
	  throw new SQLException(e);   
  } finally {
	  closeStatement(pstmt);  
	  closeConnection();
  }
  return mailVO;
  
 }

 public boolean doCreateMailCustomers(MailVO mailVO) throws   SQLException {
 
  Logger.info("Entering into MailDAO.doCreateMailCustomers(MailVO)");
  PreparedStatement pstmt = null;
  StringBuilder query = new StringBuilder();
  
  query.append(" insert into mailers_customers (mailer_id,email_id,status_id)");
  query.append(" values(?,?,?)");
    
  Logger.info(query.toString());
  
  try {
   
   pstmt = getConnection().prepareStatement(query.toString());
   
   for(String mailId:mailVO.getStrToAddress().split(",")){
    Logger.info("Storing Mail : " + mailId);
    pstmt.setLong(1,mailVO.getMailerId());
    pstmt.setString(2,mailId);
    pstmt.setLong(3,mailVO.getStatusId());            
    pstmt.execute();
   }
   
   Logger.info("MailDAO.doCreateMailCustomers(MailVO) : Sucesfully Created Mail Customer");
   
  } catch (Exception e) {
   Logger.error(e.toString());
   throw new SQLException(e);
  }finally{
   closeStatement(pstmt);
  }
 
 return true;
 }
 
 /* (non-Javadoc)
  * @see com.beyond.mail.dao.MailDAO#doDeleteMailer(com.beyond.mail.vo.MailVO)
  */
 @Override
 public MailVO doDeleteMailer(MailVO mailVO) throws SQLException {
  // TODO Auto-generated method stub
  return null;
 }

 /* (non-Javadoc)
  * @see com.beyond.mail.dao.MailDAO#doUpdateMailer(com.beyond.mail.vo.MailVO)
  */
 @Override
 public MailVO doUpdateMailer(MailVO mailVO) throws SQLException {
  // TODO Auto-generated method stub
  return null;
 }

 /* (non-Javadoc)
  * @see com.beyond.mail.dao.MailDAO#getMailersByMailerId(long)
  */
 @Override
 public MailVO getMailersByMailerId(long userId, long mailerId) throws SQLException {
    Logger.info("MailDAO.getMailersByMailerId : Entering");
    final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_mailers where user_id=? and mailer_id=?");
    MailVO vo=new MailVO();
  
  try{
    pstmtCustomers.setLong(1, userId);
    pstmtCustomers.setLong(2, mailerId);
     
    final ResultSet rs = pstmtCustomers.executeQuery();
    while (rs.next()) { 
      setBaseVOProperties(vo,rs);
      setMailProperties(rs,vo); 
    }
   
   Logger.info("MailDAO.getMailersByMailerId : Leaving ");
  
  } catch (Exception e) {
   Logger.error(e.toString());
   throw new SQLException(e);
  } finally {
   closeStatement(pstmtCustomers);
   closeConnection();
  }

  return vo;
 }

 /* (non-Javadoc)
  * @see com.beyond.mail.dao.MailDAO#getMailersByUserId(long)
  */
 @Override
 public List<MailVO> getMailersByUserId(long userId) throws SQLException {
  Logger.info("MailDAO.getMailersByUserId : Entering");
  final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_mailers where user_id=?");
  List<MailVO> mailers = new ArrayList<MailVO>(0);
  
  try{
    pstmtCustomers.setLong(1, userId);
    
    final ResultSet rs = pstmtCustomers.executeQuery();
    while (rs.next()) {
     
      MailVO vo=new MailVO();
      setBaseVOProperties(vo,rs);
      setMailProperties(rs,vo);             
      mailers.add(vo);
    }
   
   Logger.info("MailDAO.getMailersByUserId : Leaving " + mailers.size());
  
  } catch (Exception e) {
   Logger.error(e.toString());
   throw new SQLException(e);
  } finally {
   closeStatement(pstmtCustomers);
   closeConnection();
  }

  return mailers;
 } 
 
 
 @Override
 public void doCreateMailResponse(ResponseVO respVO) throws SQLException {
   
  Logger.info("Entering into MailDAO.doCreateMailResponse(ResponseVO)");
  PreparedStatement pstmt = null;
  
  StringBuilder query = new StringBuilder();
  query.append(" insert into responses (customer_id,user_id,template_id,received_on,mailer_id)");
  query.append(" values(?,?,?,?,?,?)");
    
  Logger.info(query.toString());
  
  try {
   
   pstmt = getConnection().prepareStatement(query.toString());
   
    Logger.info("Storing Response : ");
        
    pstmt.setLong(1,respVO.getContactId());
    pstmt.setLong(2,respVO.getUserId());
    pstmt.setLong(3,respVO.getTemplateId());
    pstmt.setTimestamp(4, respVO.getDateReceived());
    pstmt.setLong(5,respVO.getMailerId());
    
    pstmt.execute();
    
    doCreateMailResponseData(respVO);
    
    doUpdateMailStatus(respVO);
    
   Logger.info("MailDAO.doCreateMailResponse(ResponseVO) : Sucesfully Created Mail Response");
   
  } catch (Exception e) {
   Logger.error(e.toString());
   throw new SQLException(e);
  } finally{
   closeStatement(pstmt);
   closeConnection();
  } 
  
 }
 
 @Override
 public void doCreateMailResponseData(ResponseVO respVO) throws SQLException {
   
  Logger.info("Entering into MailDAO.doCreateMailResponseData(ResponseVO)");
  PreparedStatement pstmt = null;
  
  StringBuilder query = new StringBuilder();
  query.append(" insert into response_elements (response_id,element_id,element_value)");
  query.append(" values(?,?,?)");
    
  Logger.info(query.toString());
  
  try {
   
   pstmt = getConnection().prepareStatement(query.toString());
   
    Logger.info("Storing Response Elements");
    
    for(ElementVO e:respVO.getResponseData()){
     
     pstmt.setLong(1,respVO.getResponseId());
     pstmt.setLong(2, e.getElementId());
     pstmt.setString(3,e.getElementValue());
     pstmt.execute();
    }
     
   Logger.info("MailDAO.doCreateMailResponseData(ResponseVO) : Sucesfully Created Response Elements");
      
  } catch (Exception e) {
   Logger.error(e.toString());
   throw new SQLException(e);
  } finally{
   closeStatement(pstmt);   
  } 
  
 }
 
 private void doUpdateMailStatus(ResponseVO vo) throws Exception{
  PreparedStatement pstmt=null;
  try {
   String trackerQuery="update mailers_customers set status_id=? where mailer_id=? and customer_id=?";
   pstmt = getConnection().prepareStatement(trackerQuery);
   
   pstmt.setLong(1, MailConstants.RESPONSE_RECEIVED);
   pstmt.setLong(2, vo.getMailerId());
   pstmt.setLong(3, vo.getContactId());
   
   pstmt.execute();
  } catch (Exception e) {
   Logger.info(e.toString());
   throw new SQLException(e );
  } finally{
   closeStatement(pstmt);  
  }
 }
 
 @Override
 public synchronized void doUpdateMailDelivery(MailVO mailVO) throws SQLException{
	 
	   Logger.info("Entering MailDAO.doUpdateMailDelivery(MailVO)");
	 
	   PreparedStatement pstmt = null;
	   
	   StringBuilder query = new StringBuilder();
	   
	   query.append(" insert into mailers_delivery_log ");
	   query.append(" (mailer_id,  delivery_date, delivery_time,delivery_status," );
	   query.append(" created_on, created_by, modified_on, modified_by, is_active,contact_count,error_message)");
	   query.append(" values(?,SYSDATE(),NOW(),?,SYSDATE(),?,SYSDATE(),?,1,?,?)");
	   
	   Logger.info(query.toString());
	   
	   try {
	    
	     pstmt = getConnection().prepareStatement(query.toString());
	     
 	     pstmt.setLong(1, mailVO.getMailerId());
	     pstmt.setLong(2, mailVO.getStatusId());
  	     pstmt.setLong(3, mailVO.getIdCreatedBy());
	     pstmt.setLong(4, mailVO.getIdModifiedBy());
	     pstmt.setLong(5, mailVO.getContactCount());
	     pstmt.setString(6, mailVO.getErrors().toSimpleString());
	     pstmt.execute(); 
	     
	     Logger.info("MailDAO.doUpdateMailDelivery(MailVO): MailDelivery Log Created");
	     
	     commitTransactions();
	     
	   } catch (Exception e) {
		   Logger.error(e.toString());
		   throw new SQLException(e);
	   }finally{
		   closeStatement(pstmt);
		   closeConnection();
	   }
	 }
  
 public Long getResponseId(ResponseVO vo) throws SQLException {
  Long tId=null;
  PreparedStatement pstmt=null;
  try {
   final String sqlStr="select id from responses where user_id=? and template_id=? and customer_id=? and mailer_id=?";
   pstmt = getConnection().prepareStatement(sqlStr);
   pstmt.setLong(1, vo.getUserId());
   pstmt.setLong(2, vo.getTemplateId());
   pstmt.setLong(3, vo.getContactId());
   pstmt.setLong(4, vo.getMailerId());
   
   final ResultSet rs = pstmt.executeQuery();
 
   while (rs.next()) {
    tId=rs.getLong("id");
   }
   
   closeResultset(rs);
   
   Logger.info("TemplateDAO.getResponseId: ResponseId =" + tId);
   
  } catch (Exception e) {
   Logger.info(e.toString());
   throw new SQLException(e );
  } finally{
   closeStatement(pstmt);   
  }
  
  return tId;
 }
 
 @Override
 public void doCreateMailSchedule(MailVO mailVO) throws SQLException {
  
   Logger.info("Entering MailDAO.doCreateMailSchedule(MailVO)");
   PreparedStatement pstmt = null;
   
   StringBuilder query = new StringBuilder();
   
   query.append(" insert into mailers_schedule ");
   query.append(" (mailer_id, pattern_id, start_date, time_of_day, end_date, exclude_holidays, auto_roll,"); 
   query.append(" days_excluded, day_of_week, date_of_month, status_id, send_hours, send_minutes, send_ampm," );
   query.append(" created_on, created_by, modified_on, modified_by, is_active)");
   query.append(" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE(),?,SYSDATE(),?,1)");
   
   Logger.info(query.toString());
   
   try {
    
     pstmt = getConnection().prepareStatement(query.toString());
     
     MailScheduleVO svo= mailVO.getMailScheduleVO();
     svo.setMailerId(mailVO.getMailerId()); 
     pstmt.setLong(1, svo.getMailerId());
     pstmt.setLong(2, svo.getDeliveryPatternId());
     pstmt.setDate(3, DateUtil.getSQLDate(svo.getStartDate(), ApplicationConstants.DATE_FORMAT));
     pstmt.setTimestamp(4, svo.getDeliveryTime());
     pstmt.setDate(5,  DateUtil.getSQLDate(svo.getEndDate(), ApplicationConstants.DATE_FORMAT));
     pstmt.setInt(6,  svo.isExcludeHolidays()==true?1:0);
     pstmt.setInt(7,  svo.isAutoRoll()==true?1:0);
     pstmt.setString(8,  String.valueOf(svo.getDaysExcluded()));
     pstmt.setInt(9,  svo.getDayOfWeek());
     pstmt.setInt(10, svo.getDateOfMonth());
     pstmt.setInt(11, svo.getDelivery_status());
     pstmt.setInt(12,svo.getSendHours());
     pstmt.setInt(13,svo.getSendMinutes());
     pstmt.setInt(14,svo.getSendAmPm());
     pstmt.setLong(15,svo.getIdCreatedBy());
     pstmt.setLong(16,svo.getIdModifiedBy());
     pstmt.execute();
     
     mailVO.setMailScheduleVO(svo);
     
     Logger.info("MailDAO.doCreateMailSchedule(MailVO): Mail Schedule Created");
    
   } catch (Exception e) {
	   Logger.error(e.toString());
	   throw new SQLException(e);
   }finally{
	   closeStatement(pstmt);
   }
 }

 @Override
 public List<MailVO> getMailersByMailerAndUserId(long userId, long mailerId)
   throws SQLException {
  Logger.info("MailDAO.getMailersByUserId : Entering");
  final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_mailers where user_id=? and mailer_id=?");
  List<MailVO> mailers = new ArrayList<MailVO>(0);
  
  try{
    pstmtCustomers.setLong(1, userId);
    pstmtCustomers.setLong(2, mailerId);
     
    final ResultSet rs = pstmtCustomers.executeQuery();
    while (rs.next()) {
     
      MailVO vo=new MailVO();
      setBaseVOProperties(vo,rs);
      setMailProperties(rs,vo);
      mailers.add(vo);
    }
   
   Logger.info("MailDAO.getMailersByUserId : Leaving " + mailers.size());
  
  } catch (Exception e) {
   Logger.error(e.toString());
   throw new SQLException(e);
  } finally {
   closeStatement(pstmtCustomers);
   closeConnection();
  }

  return mailers;
 }

 @Override 
 public Map<Long, Map<Long, MailVO>> getAllMails() throws SQLException {
  Logger.info("MailDAO.getMailersByUserId : Entering");
  final PreparedStatement psUsers = getConnection().prepareStatement("select id FROM users");
  Map<Long, Map<Long, MailVO>> mailMap = new HashMap<Long, Map<Long, MailVO>>(0);
  
  try{ 
    Long userId; 
    final ResultSet rsUsers = psUsers.executeQuery();
    while (rsUsers.next()) {
      userId= rsUsers.getLong("id");
      
      final PreparedStatement psMailers = getConnection().prepareStatement("select * FROM vw_mailers where user_id=?");
      Map<Long, MailVO> mailers = new HashMap<Long, MailVO>(0);
      
      try{
        psMailers.setLong(1, userId);
          final ResultSet rsMailers = psMailers.executeQuery();
        while (rsMailers.next()) {
           MailVO vo=new MailVO();
          setBaseVOProperties(vo,rsMailers);
          setMailProperties(rsMailers,vo);
          mailers.put(vo.getMailerId(),vo);
        }
       
       Logger.info("MailDAO.getMailersByUserId : Leaving " + mailers.size());
      
      } catch (Exception e) {
       Logger.error(e.toString());
       throw new SQLException(e);
      } finally {
       closeStatement(psMailers); 
      }

     mailMap.put(userId, mailers);
     
    }
  }catch(Exception e){
   e.printStackTrace();
  }finally{
   closeStatement(psUsers);
   closeConnection();
  }
  return mailMap;
 }

 private void setMailProperties(ResultSet rs, MailVO vo) throws Exception{ 
   
   Logger.info("Entering MailDAO.setMailProperties");
   
   vo.setMailerId(rs.getLong("mailer_id"));
   vo.setTemplateId(rs.getLong("template_id"));
   vo.setUserId(rs.getLong("user_id"));
   vo.setStatusId(rs.getLong("status_id"));
   vo.setTemplateName(rs.getString("template_name"));
   vo.setStrMessage(rs.getString("template_content"));
   vo.setStrSubject(rs.getString("mail_subject"));
   vo.setDateSent(rs.getTimestamp("sent_on"));
   vo.setResponseCount(rs.getLong("responseCount"));
   vo.setContactCount(rs.getLong("contactCount"));
   vo.setSendToGroup(rs.getInt("send_to_groups")==1?true:false);
   vo.setProfileId(rs.getLong("profile_id"));
   
   if(vo.isSendToGroup()){
	  vo.setGroupIds(rs.getString("group_ids").split(","));
   }
   
   Logger.info("1. Fetching Mail Schedule ");
   vo.setMailScheduleVO(getScheduleByMailId(vo.getMailerId()));
   
   Logger.info("2. Fetching Delivery Log ");
   vo.setDeliveryLog(getMailDeliveryLog(vo.getMailerId()));
   
   Logger.info("3. Fetching Mail Profile ");
   MailPropertiesVO pvo=getMailProfileVO(vo.getProfileId());
   if(pvo!=null){
	   vo.setMailProfile(pvo);
   }
   
   Logger.info("4. Fetching Mail Contacts");
   	CustomerDAO dao=new CustomerDAOImpl(null);
	   
	   if(vo.isSendToGroup()){ 
		   String strGroupCriteria=" v.group_id in(" + rs.getString("group_ids") + ")";	   
		   Logger.info("4.1 Fetching Contacts Using Group IDs:" + strGroupCriteria );
		   vo.setContacts(dao.getCustomersByUserIdAndGroup(vo.getUserId(),strGroupCriteria));	   
	   }else{
		   Logger.info("4.1 Fetching Custom Contacts:");
		   vo.setContacts(dao.getCustomersByMailerId(vo.getMailerId(),vo.getUserId()));
	   }
	   
	dao=null; 
   Logger.info("Leaving MailDAO.setMailProperties");  
 } 
 
 public List<MailDeliveryLogVO> getMailDeliveryLog(long mailerId) throws SQLException{
	 List<MailDeliveryLogVO>  dLog=new ArrayList<MailDeliveryLogVO>();
	 final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_mailers_delivery_log where mailer_id=?");
	 
	 try{
		   pstmtCustomers.setLong(1, mailerId);
		      
		   final ResultSet rs = pstmtCustomers.executeQuery();
		    while (rs.next()) {
		      MailDeliveryLogVO vo= new MailDeliveryLogVO();
		      setBaseVOProperties(vo,rs);
		      vo.setMailerId(mailerId);
		      vo.setDeliveryLogId(rs.getLong("id"));
		      vo.setDeliveryDate( DateUtil.getSQLDateAsString(rs.getDate("delivery_date"),ApplicationConstants.DATE_FORMAT));
		      vo.setDeliveryTime(rs.getTimestamp("delivery_time"));
		      vo.setDeliveryStatus(rs.getString("delivery_status_desc"));
		      vo.setDeliveryStatusId(rs.getInt("delivery_status"));
		      vo.setContactCount(rs.getLong("contact_count"));
		      vo.setTemplateId(rs.getLong("template_id"));
		      vo.setTemplateName(rs.getString("template_name"));
		      vo.setMailSubject(rs.getString("mail_subject"));
		      vo.setErrorMessage(rs.getString("error_message"));
		      dLog.add(vo);		     
		    }
		    
		   Logger.info("MailDAO.getScheduleByMailId : Leaving ");
		  
		  } catch (Exception e) {
		   Logger.error(e.toString());
		   throw new SQLException(e);
		  } finally {
		   closeStatement(pstmtCustomers); 
		  }
	 
	 return dLog;  
 }
 
 public List<MailDeliveryLogVO> getMailDeliveryLogByUserId(long userId) throws SQLException{
	 List<MailDeliveryLogVO>  dLog=new ArrayList<MailDeliveryLogVO>();
	 final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_mailers_delivery_log where id_created_by=? order by delivery_time desc");
	 
	 try{
		   pstmtCustomers.setLong(1, userId);
		       
		   final ResultSet rs = pstmtCustomers.executeQuery();
		   
		    while (rs.next()) {
		      MailDeliveryLogVO vo= new MailDeliveryLogVO();
		      setBaseVOProperties(vo,rs);
		      vo.setMailerId(rs.getLong("mailer_id"));
		      vo.setDeliveryLogId(rs.getLong("id"));
		      vo.setDeliveryDate( DateUtil.getSQLDateAsString(rs.getDate("delivery_date"),ApplicationConstants.DATE_FORMAT));
		      vo.setDeliveryTime(rs.getTimestamp("delivery_time"));
		      vo.setDeliveryStatusId(rs.getInt("delivery_status"));
		      vo.setDeliveryStatus(rs.getString("delivery_status_desc"));
		      vo.setContactCount(rs.getLong("contact_count"));
		      vo.setTemplateId(rs.getLong("template_id"));
		      vo.setTemplateName(rs.getString("template_name"));
		      vo.setMailSubject(rs.getString("mail_subject"));
		      vo.setErrorMessage(rs.getString("error_message"));
		      dLog.add(vo);		     
		    }
		    
		   Logger.info("MailDAO.getScheduleByMailId : Leaving ");
		  
		  } catch (Exception e) {
		   Logger.error(e.toString());
		   throw new SQLException(e);
		  } finally {
		   closeStatement(pstmtCustomers); 
		  }
	 
	 return dLog; 
 }
 
 @Override
 public MailScheduleVO getScheduleByMailId(long mailerId) throws SQLException {
  Logger.info("MailDAO.getScheduleByMailId Mailer Id :" + mailerId);
  final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_mailers_schedule where mailer_id=?");
  MailScheduleVO vo = new MailScheduleVO(); 
  
  try{
   pstmtCustomers.setLong(1, mailerId);
      
   final ResultSet rs = pstmtCustomers.executeQuery();
    while (rs.next()) {
      setBaseVOProperties(vo,rs);
      vo.setMailscheduleId(rs.getLong("id"));
      vo.setDeliveryPatternId(rs.getInt("pattern_id"));
      vo.setStartDate( DateUtil.getSQLDateAsString(rs.getDate("start_date"),ApplicationConstants.DATE_FORMAT));
      vo.setDeliveryTime(rs.getTimestamp("time_of_day"));
      vo.setEndDate(DateUtil.getSQLDateAsString(rs.getDate("end_date"), ApplicationConstants.DATE_FORMAT));
      vo.setExcludeHolidays(rs.getInt("exclude_holidays")==1?true:false);
      vo.setAutoRoll(rs.getInt("auto_roll")==1?true:false);
      vo.setDateOfMonth(rs.getInt("date_of_month"));
      vo.setDelivery_status(rs.getInt("status_id"));
      vo.setNextDelivery(rs.getDate("next_delivery")); 
      vo.setSendHours(rs.getInt("send_hours"));
      vo.setSendMinutes(rs.getInt("send_minutes"));
      vo.setSendAmPm(rs.getInt("send_ampm"));
    } 
    
   Logger.info("MailDAO.getScheduleByMailId : Leaving ");
  
  } catch (Exception e) {
   Logger.error(e.toString());
   throw new SQLException(e);
  } finally {
   closeStatement(pstmtCustomers); 
  }

  return vo;
 }

@Override
public MailPropertiesVO getMailProfileVO(long profileId) throws SQLException {
	
	 	Logger.info("MailDAO.getMailProfileVO - Profile Id :" + profileId);
	
	 	final PreparedStatement pstmt = getConnection().prepareStatement("SELECT * from vw_user_mailprofiles where id=?");
		MailPropertiesVO vo = null; 
		try{
				pstmt.setLong(1, profileId); 
				final ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) { 
					vo=new MailPropertiesVO();
					setBaseVOProperties(vo, rs); 
					Logger.info("Profile Name :" + rs.getString("profile_name")); 
					vo.setSmtpFromName(rs.getString("from_name"));
					vo.setFromAddress(rs.getString("from_email"));
					vo.setSmtpUser(rs.getString("smtp_username"));
					vo.setSmtpHost(rs.getString("smtp_servername"));
					vo.setSmtpPassword(rs.getString("smtp_password"));
					vo.setSmtpPort(rs.getString("smtp_port"));					
					vo.setReplyTo(rs.getString("replyto_email")); 
					vo.setSmtpAuth(rs.getString("smtp_auth"));  
					Logger.info(vo.toString());
				}
				
			Logger.info("MailDAO.getMailProfileVO : Leaving ");
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt); 
		}

		return vo;
	 
}

@Override
public void doCreateMailTrackerLog(ResponseVO respVO) throws SQLException {
	Logger.info("Entering into MailDAO.doCreateMailTrackerLog(ResponseVO)");
	  PreparedStatement pstmt = null;
	  
	  StringBuilder query = new StringBuilder();
	  query.append(" insert into mail_tracker_log (customer_id, user_id, template_id, received_on, mailer_id, email_id, received_from_ip, user_agent,list_id)");
	  query.append(" values(?,?,?,?,?,?,?,?,?)");
	    
	  Logger.info(query.toString());
	  
	  try {
	   
	   pstmt = getConnection().prepareStatement(query.toString());
	   
	    Logger.info("Storing Mail Tracker");
	        
	    pstmt.setLong(1,respVO.getContactId());
	    pstmt.setLong(2,respVO.getUserId());
	    pstmt.setLong(3,respVO.getTemplateId());
	    pstmt.setTimestamp(4, respVO.getDateReceived());
	    pstmt.setLong(5,respVO.getMailerId());
	    pstmt.setString(6, respVO.getEmail());
	    pstmt.setString(7, respVO.getIpAddress());
	    pstmt.setString(8, respVO.getUserAgent());
	    pstmt.setLong(9, respVO.getListId());
	    
	    pstmt.execute(); 
	    
	    //doUpdateMailStatus(respVO);
	    
	    commitTransactions();
	    
	   Logger.info("MailDAO.doCreateMailTrackerLog(ResponseVO) : Sucesfully Created Mail Tracker");
	   
	  } catch (Exception e) {
	   Logger.error(e.toString()); 
	  } finally{
	   closeStatement(pstmt);  
	   closeConnection();
	  } 
	
} 
 
}

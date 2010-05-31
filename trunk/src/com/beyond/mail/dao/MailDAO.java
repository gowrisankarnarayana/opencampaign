/**
 * 
 */
package com.beyond.mail.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.beyond.base.dao.BaseDAO;
import com.beyond.mail.vo.MailDeliveryLogVO;
import com.beyond.mail.vo.MailPropertiesVO;
import com.beyond.mail.vo.MailScheduleVO;
import com.beyond.mail.vo.MailVO;
import com.beyond.mail.vo.ResponseVO;

/**
 * @author gowri
 *
 */
public interface MailDAO extends BaseDAO {

	public MailVO doCreateMailer(MailVO mailVO) throws SQLException;
	public MailVO doUpdateMailer(MailVO mailVO) throws SQLException;
	public MailVO doDeleteMailer(MailVO mailVO) throws SQLException;
	 
	public void doCreateMailResponse(ResponseVO respVO) throws SQLException;
	public void doCreateMailSchedule(MailVO mailVO) throws SQLException;
	public void doCreateMailResponseData(ResponseVO respVO) throws SQLException;
	public void doCreateMailTrackerLog(ResponseVO respVO) throws SQLException;
	
	public MailVO getMailersByMailerId(long userId,long mailerId) throws SQLException;
	public MailScheduleVO getScheduleByMailId(long mailerId) throws SQLException;
	public List<MailVO> getMailersByUserId(long userId) throws SQLException;
	public List<MailVO> getMailersByMailerAndUserId(long userId, long mailerId) throws SQLException; 
	public List<MailDeliveryLogVO> getMailDeliveryLog(long mailerId) throws SQLException;
	public List<MailDeliveryLogVO> getMailDeliveryLogByUserId(long userId) throws SQLException;
	public MailPropertiesVO getMailProfileVO(long malerId) throws SQLException;
	
	public Map<Long, Map<Long, MailVO>> getAllMails() throws SQLException;
	public void doUpdateMailDelivery(MailVO mailVO) throws SQLException;
	
	
}

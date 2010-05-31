/**
 * 
 */
package com.beyond.mail.cache;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beyond.base.cache.BaseCache;
import com.beyond.constants.ApplicationConstants;
import com.beyond.mail.dao.MailDAO;
import com.beyond.mail.dao.impl.MailDAOImpl;
import com.beyond.mail.vo.MailDeliveryLogVO;
import com.beyond.mail.vo.MailVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

/**
 * @author gowrisankar.narayana
 *
 */
public class MailCache extends BaseCache {
	
	private static Map<Long,Map<Long,MailVO>> mailMap= new HashMap<Long,Map<Long,MailVO>>(0);
	private static String status= ApplicationConstants.CACHE_NOT_INITIALIZED;
	private static Date lastRefreshed=null;
	
	/* (non-Javadoc)
	 * @see com.beyond.base.cache.BaseCache#getLastRefreshed()
	 */
	@Override
	public Date getLastRefreshed() {
	 	return lastRefreshed;
	}

	/* (non-Javadoc)
	 * @see com.beyond.base.cache.BaseCache#getName()
	 */
	@Override
	public String getName() { 
		return "MailCache";
	}

	/* (non-Javadoc)
	 * @see com.beyond.base.cache.BaseCache#getSize()
	 */
	@Override
	public long getSize() { 
		return mailMap.size();
	}

	/* (non-Javadoc)
	 * @see com.beyond.base.cache.BaseCache#getStatus()
	 */
	@Override
	public String getStatus() {
		return status;
	}

	/* (non-Javadoc)
	 * @see com.beyond.base.cache.BaseCache#initialize()
	 */
	@Override
	public void initialize() {
			try{
			
			if(!status.equalsIgnoreCase(ApplicationConstants.CACHE_INITIALIZED)){
				
				status= ApplicationConstants.CACHE_INITIALIZATION_IN_PROGRESS;
				
				MailDAO dao=new MailDAOImpl(null);	
				
				Map<Long,Map<Long, MailVO>> mails=dao.getAllMails();
				
				mailMap.putAll(mails);
				
				dao=null;
				
				status=ApplicationConstants.CACHE_INITIALIZED;
				lastRefreshed= DateUtil.getCurrentTime();
				Logger.info("MailCache Count :" + mailMap.size());
			}
		
		}catch(Exception e){
			status=ApplicationConstants.CACHE_INITIALIZATION_ERROR + e.getMessage();
			Logger.error("MailCache failed to load mails :" + e.getMessage());
			e.printStackTrace();
		}

	}

	/* (non-Javadoc)
	 * @see com.beyond.base.cache.BaseCache#refresh()
	 */
	@Override
	public void refresh() {
		// TODO Auto-generated method stub

	}

	/* (non-Javadoc)
	 * @see com.beyond.base.cache.BaseCache#refreshCache(java.lang.Long)
	 */
	@Override
	public void refreshCache(Long id) {
		// TODO Auto-generated method stub

	}

	public static List<MailVO> getMailersByUserId(long id) throws Exception {
		List<MailVO> mails=null;
		try{
			mails=new ArrayList<MailVO>(mailMap.get(id).values());	
		}catch(Exception e){
			e.printStackTrace();
			Logger.error("MailCache.getMailersByUserId Unable to retrive from cache");		
		}
		if(mails==null){
			MailDAO dao=new MailDAOImpl(null);
			mails=dao.getMailersByUserId(id);
			dao=null;
		}
		return mails; 
	}
	
	public static MailVO getMailerByMailerAndUserId(long mailerId,long userId) throws Exception{
		MailVO mailer=null;
		try{
			if(mailMap.containsKey(userId)){
				mailer=mailMap.get(userId).get(mailerId);
			}
		}catch(Exception e){
			e.printStackTrace();
			Logger.error("MailCache.getMailerByMailerAndUserId Unable to retrive from cache");		
		}
		if (mailer==null){
			MailDAO dao=new MailDAOImpl(null);
			mailer=dao.getMailersByMailerId(userId,mailerId);
			dao=null;
		}
		return mailer;
	}

	public static MailVO doCreateMailer(MailVO vo) throws Exception {
		try{
		MailDAO dao=new MailDAOImpl(null);
		vo=dao.doCreateMailer(vo);
		dao=null;
			//if(mailMap.containsKey(vo.getUserId())){
				//mailMap.get(vo.getUserId()).put(vo.getMailerId(), vo);
			//}
		}catch(SQLException e){
			e.printStackTrace();
			Logger.error(e.toString());
			throw new Exception("Failed to create mailer :" + e.getMessage());
		}
		return vo;
	}

	public static void updateMailerStatus(MailVO vo) {
			//if(mailMap.containsKey(vo.getUserId())){
			//	mailMap.get(vo.getUserId()).put(vo.getMailerId(),vo);
			//}	
		try{
		MailDAO dao=new MailDAOImpl(null);
		dao.doUpdateMailDelivery(vo);
		dao=null; 
		}catch(SQLException e){
			e.printStackTrace();
			Logger.error(e.toString()); 
		}
	}
  
	
	public static List<MailDeliveryLogVO> getDeliveryLogByUserId(long userId) throws Exception{
		Logger.info("Entering MailBO.getDeliveryLogByUserId()");
		List<MailDeliveryLogVO> delLog=new ArrayList<MailDeliveryLogVO>(0);
		try{ 
			MailDAO dao=new MailDAOImpl(null);
			delLog=dao.getMailDeliveryLogByUserId(userId);
			dao=null; 
			
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());
			throw e;
		}
		Logger.info("Leaving MailBO.getDeliveryLogByUserId() :" + delLog.size());
		return delLog;
	}

}

package com.beyond.reports.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beyond.base.dao.impl.BaseDAOImpl;
import com.beyond.reports.dao.ReportsDAO;
import com.beyond.reports.vo.GEOTrackVO;
import com.beyond.reports.vo.MailCampaignVO;
import com.beyond.reports.vo.OverallPerformanceVO;
import com.beyond.reports.vo.SubscriberStatsVO;
import com.beyond.util.Logger;

public class ReportsDAOImpl extends BaseDAOImpl implements ReportsDAO {

	public ReportsDAOImpl(Connection conn) throws SQLException {
		super(conn); 
	}

	@Override
	public List<GEOTrackVO> getGEOTrackById(long userId) throws SQLException {
		Logger.info("ReportsDAOImpl.getGEOTrackById : Entering");
		
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement(ReportsDAO.FETCH_GEO_TRACK);
		List<GEOTrackVO> trackers = new ArrayList<GEOTrackVO>(0);
		
		
		try{
				pstmtCustomers.setLong(1, userId);
				
				final ResultSet rs = pstmtCustomers.executeQuery();
				
				while (rs.next()) { 
					 GEOTrackVO tracker = new GEOTrackVO();
					 tracker.setUserId(userId);
					 tracker.setCityCode(rs.getString("CITY_CODE"));
					 tracker.setCountryCode(rs.getString("COUNTRY_CODE"));
					 tracker.setCustomerCount(rs.getLong("SUBSCRIBER_COUNT"));
					 trackers.add(tracker);
				}
			
			Logger.info("ReportsDAOImpl.getGEOTrackById : Leaving " + trackers.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return trackers;
	}

	@Override
	public OverallPerformanceVO getOverallPerformanceById(long userId) throws SQLException {
		
		Logger.info("ReportsDAOImpl.OverallPerformanceVO : Entering");
		
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement(ReportsDAO.FETCH_OVERALL_PERFORMANCE);
		
		OverallPerformanceVO performance = new OverallPerformanceVO();
		
		try{
				pstmtCustomers.setLong(1, userId);
				performance.setUserId(userId);
				 
				final ResultSet rs = pstmtCustomers.executeQuery();
				
				while (rs.next()) {  
					performance.setSentCount(rs.getLong("SENT_COUNT"));
					performance.setOpenCount(rs.getLong("OPEN_COUNT"));
				}
			
			Logger.info("ReportsDAOImpl.OverallPerformanceVO : Leaving " + performance.toString());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return performance;
	}

	@Override
	public SubscriberStatsVO getSubscriberStatsById(long userId)
			throws SQLException {
		Logger.info("ReportsDAOImpl.getSubscriberStatsById : Entering");
		
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement(ReportsDAO.FETCH_SUBSCRIBER_STATS);
		
		SubscriberStatsVO subs = new SubscriberStatsVO();
		
		try{
				pstmtCustomers.setLong(1, userId);
				subs.setUserId(userId);
				 
				final ResultSet rs = pstmtCustomers.executeQuery();
				
				while (rs.next()) {  
					subs.setTotalSubscribers(rs.getLong("TOTAL_SUBS"));
					subs.setSubscribersToday(rs.getLong("SUBS_TODAY"));
					subs.setSubscribersWeek(rs.getLong("SUBS_WEEK"));
					subs.setSubscribersMonth(rs.getLong("SUBS_MONTH"));
					subs.setSubscribersYear(rs.getLong("SUBS_YEAR"));
					subs.setUnSubscribersToday(rs.getLong("UNSUBS_TODAY"));
					subs.setUnSubscribersWeek(rs.getLong("UNSUBS_WEEK"));
					subs.setUnSubscribersMonth(rs.getLong("UNSUBS_MONTH"));
					subs.setUnSubscribersYear(rs.getLong("UNSUBS_YEAR"));
				}
			
			Logger.info("ReportsDAOImpl.getSubscriberStatsById : Leaving " + subs.toString());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return subs;
	}

	@Override
	public List<MailCampaignVO> getMailCampaignsById(long userId)
			throws SQLException {
		 Logger.info("ReportsDAOImpl.getMailCampaignsById : Entering");
		 List<MailCampaignVO>  dLog=new ArrayList<MailCampaignVO>();
		 final PreparedStatement pstmtCustomers = getConnection().prepareStatement(ReportsDAO.FETCH_MAIL_CAMPAIGNS);
		 
		 try{
			   pstmtCustomers.setLong(1, userId);
			       
			   final ResultSet rs = pstmtCustomers.executeQuery();
			   
			    while (rs.next()) {
			      MailCampaignVO vo= new MailCampaignVO();
			      vo.setMailerId(rs.getLong("mailer_id"));
			      vo.setDeliveryTime(rs.getTimestamp("delivery_time"));
			      vo.setDeliveryStatusId(rs.getInt("delivery_status"));
			      vo.setContactCount(rs.getLong("contact_count"));
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
			   closeConnection();
			  }
			  
			  Logger.info("ReportsDAOImpl.getMailCampaignsById : Leaving " + dLog.size());
			  
		 return dLog; 
	}

}

package com.beyond.reports.dao;

import java.sql.SQLException;
import java.util.List;

import com.beyond.base.dao.BaseDAO;
import com.beyond.reports.vo.GEOTrackVO;
import com.beyond.reports.vo.MailCampaignVO;
import com.beyond.reports.vo.OverallPerformanceVO;
import com.beyond.reports.vo.SubscriberStatsVO;

public interface ReportsDAO extends BaseDAO {

	public static String FETCH_OVERALL_PERFORMANCE ="select * from vw_overall_campaign where user_id=?";
	public static String FETCH_GEO_TRACK ="select * from vw_geo_tracker where user_id=?";
	public static String FETCH_SUBSCRIBER_STATS ="select * from vw_subscriber_stats where user_id=?";
	public static String FETCH_MAIL_CAMPAIGNS = "select * FROM vw_mailers_delivery_log where id_created_by=? order by delivery_time desc limit 0,5";
	
	public OverallPerformanceVO getOverallPerformanceById(long userId) throws SQLException;
	public List<GEOTrackVO> getGEOTrackById(long userId) throws SQLException;
	public SubscriberStatsVO getSubscriberStatsById(long id) throws SQLException;
	public List<MailCampaignVO> getMailCampaignsById(long id) throws SQLException;
	
}

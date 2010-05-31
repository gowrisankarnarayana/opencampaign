package com.beyond.reports.bo;

import java.util.List;

import com.beyond.base.bo.BaseBO;
import com.beyond.reports.dao.ReportsDAO;
import com.beyond.reports.dao.impl.ReportsDAOImpl;
import com.beyond.reports.vo.GEOTrackVO;
import com.beyond.reports.vo.MailCampaignVO;
import com.beyond.reports.vo.OverallPerformanceVO;
import com.beyond.reports.vo.SubscriberStatsVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

public class ReportsBO extends BaseBO {

	public ReportsBO(UserVO user) throws Exception{
		super(user);
	}
	
	public OverallPerformanceVO getOverallPerformance(){
		OverallPerformanceVO vo=null;
		try{
			ReportsDAO dao=new ReportsDAOImpl(null);
			vo=dao.getOverallPerformanceById(userVO.getId());
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		return vo;
	}
	
	public List<GEOTrackVO> getGEOTracker(){
		List<GEOTrackVO> trackers=null;
		try{
			ReportsDAO dao=new ReportsDAOImpl(null);
			trackers=dao.getGEOTrackById(userVO.getId());
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		return trackers;
	}
	
	public SubscriberStatsVO getSubscriberStats(){
		SubscriberStatsVO vo=null;
		try{
			ReportsDAO dao=new ReportsDAOImpl(null);
			vo=dao.getSubscriberStatsById(userVO.getId());
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		return vo;
	}
	
	public List<MailCampaignVO> getRecentMailCampaigns(){
		List<MailCampaignVO> campaigns=null;
		try{
			ReportsDAO dao=new ReportsDAOImpl(null);
			campaigns=dao.getMailCampaignsById(userVO.getId());
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		return campaigns;
	}
	
}

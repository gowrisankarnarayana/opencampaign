package com.beyond.dwr.action;

import java.util.List;

import com.beyond.constants.MessageConstants;
import com.beyond.reports.bo.ReportsBO;
import com.beyond.reports.vo.GEOTrackVO;
import com.beyond.reports.vo.MailCampaignVO;
import com.beyond.reports.vo.OverallPerformanceVO;
import com.beyond.reports.vo.SubscriberStatsVO;
import com.beyond.util.Logger;

public class ReportsAction extends DwrBase {

	public OverallPerformanceVO getOverallPerformance(){
		Logger.info("Begin DWR ReportsAction.getOverallPerformance()"); 
		 
		OverallPerformanceVO vo=null;
		try{
			if(!isValidUser()){
			 	throw new Exception(MessageConstants.INVALID_USER);	
			} 
			
			ReportsBO bo=new ReportsBO(user);
			vo=bo.getOverallPerformance();
			
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		Logger.info("End DWR ReportsAction.getOverallPerformance()"); 
		return vo;
	}
	
	public List<GEOTrackVO> getGEOTracker(){
		Logger.info("Begin DWR ReportsAction.getGEOTracker()"); 
		List<GEOTrackVO> trackers=null;
		try{
			
			if(!isValidUser()){
			 	throw new Exception(MessageConstants.INVALID_USER);	
			} 
			
			ReportsBO bo=new ReportsBO(user);
			trackers=bo.getGEOTracker();
			
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		Logger.info("End DWR ReportsAction.getGEOTracker()"); 
		return trackers;
	}
	
	public SubscriberStatsVO getSubscriberStats(){
		Logger.info("Begin DWR ReportsAction.SubscriberStatsVO()"); 
		SubscriberStatsVO vo=null;
		try{
			if(!isValidUser()){
			 	throw new Exception(MessageConstants.INVALID_USER);	
			} 
			
			ReportsBO bo=new ReportsBO(user);
			vo=bo.getSubscriberStats();
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		Logger.info("End DWR ReportsAction.SubscriberStatsVO()"); 
		return vo;
	}
	

	public List<MailCampaignVO> getRecentMailCampaigns(){
		Logger.info("Begin DWR ReportsAction.getRecentMailCampaigns()"); 
		List<MailCampaignVO> campaigns=null;
		try{
			if(!isValidUser()){
			 	throw new Exception(MessageConstants.INVALID_USER);	
			} 
			
			ReportsBO bo=new ReportsBO(user);
			campaigns=bo.getRecentMailCampaigns();
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage()); 
		}
		Logger.info("End DWR ReportsAction.getRecentMailCampaigns()"); 
		return campaigns;
	}
}

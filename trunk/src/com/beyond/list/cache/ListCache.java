package com.beyond.list.cache;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beyond.base.cache.BaseCache;
import com.beyond.constants.ApplicationConstants;
import com.beyond.list.dao.ListDAO;
import com.beyond.list.dao.impl.ListDAOImpl;
import com.beyond.list.vo.ListVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class ListCache extends BaseCache {

	private static Map<Long,Map<Long, ListVO>> groupMap= new HashMap<Long,Map<Long,ListVO>>(0);
	private static String status= ApplicationConstants.CACHE_NOT_INITIALIZED;
	private static Date lastRefreshed=null;
		
	@Override
	public long getSize() {
		return groupMap.size();
	}
 
	@Override
	public String getStatus() {
		return status;
	}

	@Override
	public String getName() {
	  return "ListCache";
	}

	@Override
	public Date getLastRefreshed() {
		return lastRefreshed;
	}

	@Override
	public void initialize() {
		try{
			
			if(!status.equalsIgnoreCase(ApplicationConstants.CACHE_INITIALIZED)){
				
				status= ApplicationConstants.CACHE_INITIALIZATION_IN_PROGRESS;
				
				ListDAO dao=new ListDAOImpl(null);		
				Map<Long,Map<Long, ListVO>> groups=dao.getAllGroups();
			
				groupMap.putAll(groups);
				
				dao=null;
				
				status=ApplicationConstants.CACHE_INITIALIZED;
				lastRefreshed= DateUtil.getCurrentTime();
				Logger.info("ListCache Count :" + groups.size());
			}
		
		}catch(Exception e){
			status=ApplicationConstants.CACHE_INITIALIZATION_ERROR + e.getMessage();
			Logger.error("ListCache failed to load groups :" + e.getMessage());
			e.printStackTrace();
		}
		
	}

	
	@Override
	public void refresh() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void refreshCache(Long id) {
		// TODO Auto-generated method stub
		
	}

	public static List<ListVO> getGroupsByUserId(long id) throws Exception {
		List<ListVO> groups= new ArrayList<ListVO>(0);
		 if(groupMap.containsKey(id)){
			 groups= new ArrayList<ListVO>(groupMap.get(id).values());
		 }

		 if(groups.size()==0){
			 ListDAO dao= new ListDAOImpl(null);
			 groups = dao.getGroupsByUserId(id); 
			 dao=null; 
		 }
		 return groups;
	}

	public static ListVO doCreateGroup(ListVO vo) throws Exception{
		try{
			ListDAO dao= new ListDAOImpl(null);
			vo=dao.doCreateCustomerGroup(vo);
			dao=null;
			if(groupMap.containsKey(vo.getUserId())){
			   groupMap.get(vo.getUserId()).put(vo.getGroupId(),vo);
			}
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString()); 
		}
		return vo;
	}

	public static void setDefaultGroup(long id, long groupId) throws Exception{
		Logger.info("ListCache.setDefaultGroup");
		ListDAO dao=new ListDAOImpl(null);
		dao.setDefaultGroup(id,groupId);
		dao=null;
	}

	public static void deleteGroup(long id, long groupId) throws Exception {
		Logger.info("ListCache.deleteGroup");
		ListDAO dao=new ListDAOImpl(null);
		dao.doDeleteGroup(id,groupId);
		dao=null; 
	}

	public static void doUpdateGroup(ListVO vo) throws Exception {
		Logger.info("ListCache.deleteGroup");
		ListDAO dao=new ListDAOImpl(null);
		dao.doUpdateGroup(vo);
		dao=null; 
	}

}

package com.beyond.user.cache;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beyond.base.cache.BaseCache;
import com.beyond.constants.ApplicationConstants;
import com.beyond.user.dao.UserDAO;
import com.beyond.user.dao.impl.UserDAOImpl;
import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class UserCache extends BaseCache implements Serializable  {
 
	private static final long serialVersionUID = 2267885814340974491L;
	private static Map<Long,UserVO> userMap= new HashMap<Long,UserVO>(0);
	private static String status= ApplicationConstants.CACHE_NOT_INITIALIZED;
	private static Date lastRefreshed=null;
	
	public synchronized void initialize(){
		try{
			if(!status.equalsIgnoreCase(ApplicationConstants.CACHE_INITIALIZED)){
				status=ApplicationConstants.CACHE_INITIALIZATION_IN_PROGRESS;
				UserDAO dao=new UserDAOImpl(null);		
				List<UserVO> users=dao.getAllUsers();
					for(UserVO u:users){
						userMap.put(u.getId(),u);
					}
				dao=null;
				status=ApplicationConstants.CACHE_INITIALIZED;
				lastRefreshed= DateUtil.getCurrentTime();
				Logger.info("UserCache Count :" + users.size());
			}			
		}catch(Exception e){
			status=ApplicationConstants.CACHE_INITIALIZATION_ERROR + e.getMessage();
			Logger.error("UserCache failed to initialize :" + e.getMessage());
			e.printStackTrace();
		}
	}
	
 
	public static void add(UserVO vo){
		userMap.put(vo.getId(),vo);
	}
	public static void remove(Long userId){
		userMap.remove(userId);
	}
	public static UserVO update(UserVO vo) throws Exception{
		UserDAO dao=new UserDAOImpl(null);	
		vo=dao.doUpdateUser(vo);
		dao=null; 
		return vo;
	}
	
	public static UserVO getUserByUserId(Long userId) throws Exception {
			UserVO user=null; 
			UserDAO dao=new UserDAOImpl(null);	
			user=dao.getUserByUserId(userId);
	 		dao=null;  
	return user;
	}


	@Override
	public String getName() {
		return "UserCache";
	}


	@Override
	public long getSize() {
		return userMap.size();
	}
 
	@Override
	public String getStatus() {
		return status;
	}
  
	@Override
	public void refresh() {
		initialize();
	}
 
	@Override
	public Date getLastRefreshed() {
		return lastRefreshed;
	}


	@Override
	public void refreshCache(Long id) {
		// TODO Auto-generated method stub
		
	}


	public static EmailProfileVO createMailProfile(EmailProfileVO vo) throws Exception{
	 	UserDAO dao=new UserDAOImpl(null);	
	 	vo=dao.doCreateMailProfile(vo);
 		dao=null;  
 		return vo;
	}


	public static List<EmailProfileVO> getEmailProfiles(long id) throws Exception {
		List<EmailProfileVO> profiles=new ArrayList<EmailProfileVO>(0);
		UserDAO dao=new UserDAOImpl(null);	
	 	profiles=dao.getMailProfileByUserId(id);
 		dao=null;  
 		return profiles;
	}
  
}

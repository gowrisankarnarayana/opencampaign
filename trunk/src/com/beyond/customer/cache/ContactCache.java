package com.beyond.customer.cache;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.beyond.base.cache.BaseCache;
import com.beyond.constants.ApplicationConstants;
import com.beyond.customer.dao.CustomerDAO;
import com.beyond.customer.dao.impl.CustomerDAOImpl;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class ContactCache extends BaseCache implements Serializable {
 
	private static final long serialVersionUID = -1922455550230877897L;
	private static Map<Long,Map<Long, CustomerVO>> contactMap= new HashMap<Long,Map<Long,CustomerVO>>(0);
	private static String status= ApplicationConstants.CACHE_NOT_INITIALIZED;
	private static Date lastRefreshed=null;
		
	public void initialize(){
		
		try{
			
			if(!status.equalsIgnoreCase(ApplicationConstants.CACHE_INITIALIZED)){
				
				status= ApplicationConstants.CACHE_INITIALIZATION_IN_PROGRESS;
				
				CustomerDAO dao=new CustomerDAOImpl(null);		
				Map<Long,Map<Long, CustomerVO>> contacts=dao.getAllCustomers();
			
				contactMap.putAll(contacts);
				
				dao=null;
				
				status=ApplicationConstants.CACHE_INITIALIZED;
				lastRefreshed= DateUtil.getCurrentTime();
				Logger.info("ContactCache Count :" + contacts.size());
			}
		
		}catch(Exception e){
			status=ApplicationConstants.CACHE_INITIALIZATION_ERROR + e.getMessage();
			Logger.error("ContactCache failed to load contacts :" + e.getMessage());
			e.printStackTrace();
		}
		
	} 
	
	@Override
	public void refresh(){
		try{
			status=ApplicationConstants.CACHE_REFRESH_IN_PROGRESS;
			 
			initialize();
			 
			status=ApplicationConstants.CACHE_REFRESHED;
			lastRefreshed= DateUtil.getCurrentTime(); 
			
		}catch(Exception e){
			status=ApplicationConstants.CACHE_REFRESH_ERROR + e.getMessage();
			Logger.error("ContactCache failed to refresh contacts :" + e.getMessage());
			e.printStackTrace();
		} 
	}
 
	public static CustomerVO add(CustomerVO vo) throws SQLException{
		CustomerDAO dao= new CustomerDAOImpl(null);
		vo= dao.doCreateCustomer(vo);
	 	dao.commitTransactions();
	 	dao=null;
	 	if(contactMap.containsKey(vo.getUserId())){
	 		contactMap.get(vo.getUserId()).put(vo.getCustomerId(), vo);
	 	}
	 	return vo;
	}
	
	 
	public static void removeByUserIdAndEmail(Long userId, String email) throws SQLException{
		CustomerDAO dao= new CustomerDAOImpl(null);
		dao.doDeleteCustomerByEmail(userId,email);
		dao.commitTransactions();
		dao=null;
		
		if(contactMap.containsKey(userId)){
			for(CustomerVO vo: contactMap.get(userId).values()){
				if(vo.getEmail().equalsIgnoreCase(email)){
					contactMap.get(userId).remove(vo.getCustomerId()); 
					break;
				}
			}	
		}
		
	}
	
	public static void update(CustomerVO vo) throws SQLException{
		
		Logger.info("Updating contact UserId :" + vo.getUserId() + " ContactId :" + vo.getCustomerId());
		
		CustomerDAO dao= new CustomerDAOImpl(null);	
		vo=dao.doUpdateCustomer(vo);
		dao=null;
		
		if(contactMap.containsKey(vo.getUserId())){
			Map<Long,CustomerVO> tmp= contactMap.get(vo.getUserId());
			tmp.put(vo.getCustomerId(),vo);
			contactMap.put(vo.getUserId(),tmp);
		}
		
	}
	
	public static List<CustomerVO> getContactsByUserId(Long userId) throws SQLException {
		List<CustomerVO> customers=null;
		if(contactMap.containsKey(userId)){
			customers=new ArrayList<CustomerVO>(contactMap.get(userId).values());
		}
		if(customers==null){
			Logger.info("ContactCache.getContactsByUserId: From Database");
			CustomerDAO dao=new CustomerDAOImpl(null);
			customers=dao.getCustomersByUserId(userId);
			dao=null;
		}
		return customers;
	}
	
	public static Set<CustomerVO> getContactsByUserIdAndGroup(Long userId,Long groupId) throws Exception {
		Logger.info("Finding Contacts By User : " + userId + " GroupId: " + groupId);
		Set<CustomerVO> contacts=new HashSet<CustomerVO>(0);
		
		if(contactMap.containsKey(userId)){
			Logger.info("Found Contacts. Finding ContactGroups Now"); 	
			for(CustomerVO vo: contactMap.get(userId).values()){
				if(vo.hasGroup(groupId)){
					contacts.add(vo);
				}
			}
		}
		if(contacts.size()==0){
			Logger.info("ContactCache.getContactsByUserIdAndGroup: From Database");
			CustomerDAO dao=new CustomerDAOImpl(null);
			contacts=dao.getCustomersByUserIdAndGroup(userId, " v.group_id =" + groupId);
			dao=null; 
		}
		
	 	return contacts;
	}

 
	
	public static Set<CustomerVO> getContactsByUserIdAndTerm(Long userId,String term) throws Exception {
		Logger.info("Finding Contacts By User : " + userId + " Term: " + term);
		
		Set<CustomerVO> contacts=new HashSet<CustomerVO>(0);
		
		if(contactMap.containsKey(userId)){
			for(CustomerVO vo: contactMap.get(userId).values()){ 
				if(vo.hasTerm(term)){
					contacts.add(vo);
				}
			}
		}
		if(contacts.size()==0){
			Logger.info("ContactCache.getContactsByUserIdAndTerm: From Database");
			CustomerDAO dao=new CustomerDAOImpl(null);
			String tmp=" email like '%"+term+ "%' or first_name like '%"+term+ "%' or last_name like '%"+term+ "%'";
			contacts=dao.getCustomersByUserIdAndTerm(userId, tmp);
			dao=null; 
		}
	 	
		return contacts;
	}
	
	public static CustomerVO getContactByUserIdAndEmail(Long userId, String email) throws Exception {
		Logger.info("Finding ContactByUserIdAndEmail : " + userId + " Email: " + email);
		CustomerVO contact=null;
		if(contactMap.containsKey(userId)){
			for(CustomerVO vo: contactMap.get(userId).values()){
				if(vo.getEmail().equalsIgnoreCase(email) ){
					contact=vo;
					break;
				}
			}
		} 
		if(contact==null){
			Logger.info("ContactCache.getContactByUserIdAndEmail: From Database");
			CustomerDAO dao=new CustomerDAOImpl(null);
			contact=dao.getCustomerByEmail(email, userId);
			dao=null; 
		}
		
	 	return contact;
	}


	@Override
	public long getSize() {
		return contactMap.size();
	}
 
	@Override
	public String getStatus() {
		return status;
	}

	@Override
	public String getName() {
	  return "ContactCache";
	}

	@Override
	public Date getLastRefreshed() {
		return lastRefreshed;
	}

	@Override
	public void refreshCache(Long id) {
		try{
			
			if(!status.equalsIgnoreCase(ApplicationConstants.CACHE_INITIALIZATION_IN_PROGRESS) && !status.equals(ApplicationConstants.CACHE_REFRESH_IN_PROGRESS)){
				
				Logger.info("Refreshing cache of user : " + id);
				
				status= ApplicationConstants.CACHE_REFRESH_IN_PROGRESS;
				
				CustomerDAO dao=new CustomerDAOImpl(null);		
				Map<Long, CustomerVO> contacts=dao.getCustomersMapByUserId(id);
				contactMap.put(id,contacts);
				dao=null;
				
				status=ApplicationConstants.CACHE_REFRESHED;
				lastRefreshed= DateUtil.getCurrentTime();
				Logger.info("ContactCache Count :" + contacts.size());
			}
		
		}catch(Exception e){
			status=ApplicationConstants.CACHE_REFRESH_ERROR + e.getMessage();
			Logger.error("ContactCache failed to refresh cache :" + e.getMessage());
			e.printStackTrace();
		}
		
	} 
	
	
}

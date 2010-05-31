package com.beyond.customer.bo;

import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.beyond.base.bo.BaseBO;
import com.beyond.constants.MessageConstants;
import com.beyond.constants.SearchConstants;
import com.beyond.constants.ValidationConstants;
import com.beyond.customer.cache.ContactCache;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

public class CustomerBO extends BaseBO{
 
	public CustomerBO(UserVO userVO) throws Exception {
		super(userVO); 
	}

	public CustomerVO getCustomerByEmail(String email) throws Exception{
		CustomerVO vo=ContactCache.getContactByUserIdAndEmail(userVO.getId(),email);
		return vo;
	} 
	
	public String deleteContact(String email) throws Exception{
		String msg=MessageConstants.CONTACT_DELETE_FAILED; 
		try{
			 ContactCache.removeByUserIdAndEmail(userVO.getId(),email);
			 msg=MessageConstants.CONTACT_DELETE_SUCCEDED + " (" +email + ")" ;
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString()); 
		}
		return msg;
	}
	
	public List<CustomerVO> getCustomersByUser() throws Exception{ 
		 List<CustomerVO> customers= ContactCache.getContactsByUserId(userVO.getId());
		 return customers;
	}

	public CustomerVO createCustomer(CustomerVO customerVO) throws Exception{
			
		Logger.info("CustomerBO.createCustomer() Customer Name : " + customerVO.getFirstName()); 
		validate(customerVO); 
		try{ 
				setBaseAttributes(customerVO);
				
				customerVO.setUserId(userVO.getId());
				customerVO=ContactCache.add(customerVO);	
				
	 	Logger.info("CustomerBO.createCustomer() Customer Created Sucessfully"); 
		}catch(SQLException e){
			throw new Exception(e);
		} 
		Logger.info(customerVO.toString());
		return customerVO;
		
	}
	
	public void validate(CustomerVO customerVO) throws  Exception{
		
		if(customerVO.getFirstName()==null || customerVO.getFirstName().equals("")){
			throw new  Exception(ValidationConstants.FIRST_NAME_MANDATORY);
		}
		
		if(customerVO.getEmail()==null || customerVO.getEmail().equals("")){
			throw new  Exception(ValidationConstants.EMAIL_MANDATORY);
		}

	}

	public Set<CustomerVO> getCustomers(String searchTerm, String searchKey) throws Exception{
	  
		Set<CustomerVO> customers=new HashSet<CustomerVO>(0);
		
		if(searchKey.equalsIgnoreCase(SearchConstants.SEARCH_BY_GROUP)){
			customers=ContactCache.getContactsByUserIdAndGroup(userVO.getId(), Long.valueOf(searchTerm));	
		}else{
			customers=ContactCache.getContactsByUserIdAndTerm(userVO.getId(),searchTerm);
		}
		
		return customers;
		
	}  

	public String updateContact(CustomerVO cvo) throws Exception{
		String msg=MessageConstants.CONTACT_UPDATE_FAILED;
		try{
			cvo.setUserId(userVO.getId());
			cvo.setIdModifiedBy(userVO.getId());
			cvo.setActive(true);
			ContactCache.update(cvo);
			msg=MessageConstants.CONTACT_UPDATE_SUCCEDED;
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());			
		}
		return msg; 
	}
 
 
}

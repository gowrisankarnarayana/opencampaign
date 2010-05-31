package com.beyond.user.bo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beyond.base.bo.BaseBO;
import com.beyond.constants.MessageConstants;
import com.beyond.constants.UserConstants;
import com.beyond.user.cache.UserCache;
import com.beyond.user.dao.UserDAO;
import com.beyond.user.dao.impl.UserDAOImpl;
import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;
 

public class UserBO extends BaseBO {
 

	public UserBO() throws Exception{
		  
	}
	
	public UserBO(UserVO userVO) throws  Exception{
		super(userVO); 
	}
	
	public UserVO validateLogin(String email, String userPassword)throws Exception{
		UserVO vo=new UserVO();
		UserDAO userDAO= new UserDAOImpl(null);
		Logger.info("LoginBO.validateLogin() User Mail : " + email + "   Password : " + userPassword);
		
		try{
			
			long userId=userDAO.isValidUser(email,userPassword);
			
			if(userId>0){
				vo=UserCache.getUserByUserId(userId);
				vo.setValidUser(true);
			}else{
				vo.setValidUser(false);
			}
			
		}catch(SQLException e){
			throw new Exception(e);
		} 
		Logger.info(vo.toString());
		return vo;
	}
	

	public boolean register(UserVO vo)throws Exception{
		
		Logger.info("UserBO.register ");
		UserDAO userDAO= new UserDAOImpl(null);
		try{
		
			vo.setUserGroupId(UserConstants.SUPER_USERS);	
			vo.setIdCreatedBy(UserConstants.SYSTEM_ADMINISRATOR);
			vo.setIdModifiedBy(UserConstants.SYSTEM_ADMINISRATOR);
			vo.setUserPassword(vo.getFirstName());//Change this ASAP. Send user authentication details via mail.	
			vo=userDAO.doInsertUser(vo);
			
		}catch(SQLException e){
			throw new Exception(e);
		} 
		
		Logger.info("Sucessfully created the user : " + vo.toString());
		
		return true;
	}

	/* This method is called when a user is created by another user of the system 
	 * and this is different from register() method
	 * 1. User Properties are copied from Creator
	 * 2. User Company Details are copied from Creator
	 * */
	public synchronized UserVO createUser(UserVO vo) throws Exception {
		
		Logger.info("UserBO.createUser");
		
			setBaseAttributes(vo);
			setUserAttributes(vo);
			UserDAO userDAO= new UserDAOImpl(null);
		try{
			
			Logger.info("UserBO.createUser Calling DAO");
			vo= userDAO.doInsertUser(vo);
			vo.setActionMessage(MessageConstants.USER_CREATION_SUCCEDED);
			
		}catch(SQLException e){
			Logger.error(e.toString());
			vo.setErrorFlag(true);
			vo.setActionMessage(MessageConstants.USER_CREATION_FAILED);
		} 
		
		Logger.info(vo.toString());
		
		return vo;
		
	}
	
	private void setUserAttributes(UserVO vo){
		
		Logger.info("UserBO Setting New User Attribtues");
		
		vo.setActive(true);
		vo.setValidUser(true);
		vo.setConfiguration(true);
		vo.setConfirmed(true);
		vo.setUserPassword(vo.getFirstName());//Change this ASAP. Send user authentication details via mail.	
		vo.setAccountVO(userVO.getAccountVO());
		
	}

	public UserVO updateUser(UserVO uVO) throws Exception{
		uVO=UserCache.update(uVO);
		return uVO;
		
	}

	public EmailProfileVO createMailProfile(EmailProfileVO vo) throws Exception{
		 setBaseAttributes(vo);
		 vo.setUserId(userVO.getId());
		 vo=UserCache.createMailProfile(vo);
		 return vo;
	}

	public List<EmailProfileVO> getMailProfiles() throws Exception{
		List<EmailProfileVO> profiles= new ArrayList<EmailProfileVO> (0);
		profiles=UserCache.getEmailProfiles(userVO.getId());
		return profiles;
	}
		
}

/**
 * 
 */
package com.beyond.dwr.action;

import java.util.ArrayList;
import java.util.List;

import com.beyond.constants.MessageConstants;
import com.beyond.user.bo.UserBO;
import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

/**
 * @author gowri
 *
 */
public class UserAction extends DwrBase {

 	public UserAction() {
	}
 	
 	public UserVO createUser(UserVO vo) throws Exception{
 		
 		Logger.info("Begin DWR UserAction createUser");
		 
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		UserBO bo= new UserBO(user);
		Logger.info(vo.toString());
		vo= bo.createUser(vo);
		
		return vo;		
 	}

 	public List<EmailProfileVO> getMailProfiles() throws Exception{
 		Logger.info("Begin DWR UserAction createMailProfile");
		 
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		List<EmailProfileVO> pl=new ArrayList<EmailProfileVO>(0);
		try{
			UserBO bo= new UserBO(user); 
			pl=bo.getMailProfiles();
			bo=null;
		}catch(Exception e){
			e.printStackTrace();
			Logger.info(e.toString()); 
		}
		return pl;
 	}
 	public String createMailProfile(EmailProfileVO vo) throws Exception{

 		Logger.info("Begin DWR UserAction createMailProfile");
		 
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		String msg="Mail profile created";
		
		try{
			UserBO bo= new UserBO(user);
			Logger.info(vo.toString());
			bo.createMailProfile(vo);
			bo=null;
		}catch(Exception e){
			e.printStackTrace();
			Logger.info(e.toString());
			msg=e.toString();
		}
		return msg; 
 	}
}

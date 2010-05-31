package com.beyond.dwr.action;

import com.beyond.autoresponse.bo.AutoResponseBO;
import com.beyond.autoresponse.vo.AutoResponseVO;
import com.beyond.constants.MessageConstants;
import com.beyond.util.Logger;

public class AutoResponseAction extends DwrBase {

	public AutoResponseAction() {
		super();
		// TODO Auto-generated constructor stub
	}

public String updateResponse(AutoResponseVO vo) throws Exception{
 		
 		Logger.info("Begin DWR AutoResponseAction updateResponse");
		  
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		Logger.info(vo.toString());
		
		String msg= new AutoResponseBO(user).updateAutoResponse(vo);
		
		return msg;
 	}
}

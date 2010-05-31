/**
 * 
 */
package com.beyond.dwr.action;

import java.io.Serializable;

import com.beyond.constants.MessageConstants;
import com.beyond.mail.bo.MailBO;
import com.beyond.mail.vo.MailVO;
import com.beyond.util.Logger;

/**
 * @author gowri
 *
 */
public class MailAction extends DwrBase implements Serializable {
 
 
	private static final long serialVersionUID = 1L;

	public MailAction() {
		// TODO Auto-generated constructor stub
	}
	
	public MailVO validateMail(MailVO vo) throws Exception{
 		Logger.info("Begin DWR MailAction validateMail");
		 
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		 
		MailBO bo=new MailBO(user);
			vo=  bo.validate(vo);
		return vo;
 	}

}

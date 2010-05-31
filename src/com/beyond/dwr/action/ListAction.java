package com.beyond.dwr.action;

import com.beyond.constants.MessageConstants;
import com.beyond.list.bo.ListBO;
import com.beyond.list.vo.ListVO;
import com.beyond.util.Logger;

public class ListAction extends DwrBase {

	public ListAction() {
		// TODO Auto-generated constructor stub
	}
	
	public ListVO createGroup(String groupName, String groupDesc) throws Exception{
 		
 		Logger.info("Begin DWR ListAction.createGroup()");
		
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		ListVO vo= new ListBO(user).createGroup(groupName,groupDesc);
		
		return vo;
 	}
 	
	public String createList(ListVO vo) throws Exception{
 		
 		Logger.info("Begin DWR ListAction.createList()");
		
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		Logger.info(vo.toString());
		String msg= new ListBO(user).createList(vo); 
		return msg;
 	}
	
 	public String setDefaultGroup(long groupId) throws Exception{
 		Logger.info("Begin DWR ListAction.setDefaultGroup");
 		
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}

		String msg="Failed to update group";
		
		msg= new ListBO(user).setDefaultGroup(groupId);
		
		Logger.info("End DWR CustomerAction setDefaultGroup");
		
		return msg;
		
 	}
 	public String deleteGroup(long groupId) throws Exception{
 		Logger.info("Begin DWR ListAction.deleteGroup");
 		
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}

		String msg="Failed to delete group";
		
		msg= new ListBO(user).deleteGroup(groupId);
		
		Logger.info("End DWR ListAction.deleteGroup");
		
		return msg;
		
 	}
 	
 	public String updateList(ListVO vo) throws Exception{
 		Logger.info("Begin DWR ListAction.updateList");
 		
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		Logger.info(vo.toString());
		
		String msg="Failed to update group";
		
		msg= new ListBO(user).updateList(vo);
		
		Logger.info("End DWR ListAction.deleteGroup");
		
		return msg;
		
 	}
}

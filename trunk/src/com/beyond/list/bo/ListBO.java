package com.beyond.list.bo;

import java.util.List;

import com.beyond.base.bo.BaseBO;
import com.beyond.list.cache.ListCache;
import com.beyond.list.vo.ListVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

public class ListBO extends BaseBO {

	public ListBO(UserVO userVO) throws Exception {
		super(userVO);
		// TODO Auto-generated constructor stub
	} 

	public ListVO createGroup(String groupName,String groupDesc) throws Exception{
		
		ListVO vo=new ListVO();
		setBaseAttributes(vo);
		vo.setUserId(userVO.getId());
		vo.setGroupName(groupName);
		vo.setGroupDesc(groupDesc); 
		vo= ListCache.doCreateGroup(vo);
		return vo;
	} 
	
	public List<ListVO> getCustomerGroups() throws Exception{
	 	List<ListVO> groups=ListCache.getGroupsByUserId(userVO.getId());
		return groups;
	}
	
	public String setDefaultGroup(long groupId) {
		String msg="Update failed";
		try{
			ListCache.setDefaultGroup(userVO.getId(),groupId);
			msg="Updated default group";
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());			
		}
		return msg;
	}
	public String deleteGroup(long groupId) {
		String msg="Delete list failed";
		try{
			ListCache.deleteGroup(userVO.getId(),groupId);
			msg="Deleted list sucessfully";
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.toString());			
		}
		return msg;
	}

	public String createList(ListVO vo){
		String msg="List " + vo.getGroupName() + " sucessfully created";
		try{
		setBaseAttributes(vo);
		vo.setUserId(userVO.getId());
		vo= ListCache.doCreateGroup(vo);
		}catch(Exception e){
			msg="Failed to create group";
			Logger.error(e.toString());
		}
		return msg;
	}

	public String updateList(ListVO vo) {
		String msg="List " + vo.getGroupName() + " sucessfully updated";
		try{
			setBaseAttributes(vo);
			vo.setUserId(userVO.getId());
			ListCache.doUpdateGroup(vo);
		}catch(Exception e){
			msg="Failed to update list";
			Logger.error(e.toString());
		}
		return msg;
	}
}

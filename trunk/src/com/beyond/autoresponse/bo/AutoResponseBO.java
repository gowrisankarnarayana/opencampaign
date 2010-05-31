package com.beyond.autoresponse.bo;

 

import com.beyond.autoresponse.dao.AutoResponseDAO;
import com.beyond.autoresponse.dao.impl.AutoResponseDAOImpl;
import com.beyond.autoresponse.vo.AutoResponseVO;
import com.beyond.base.bo.BaseBO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

public class AutoResponseBO extends BaseBO {
 
	public AutoResponseBO(UserVO userVO) throws Exception {
		super(userVO); 
	}

	public String updateAutoResponse(AutoResponseVO vo) throws Exception{
		String msg="Saved autoresponse sucessfully"; 
		try{
			
			setBaseAttributes(vo);
			vo.setUserId(userVO.getId()); 
			AutoResponseDAO dao=new AutoResponseDAOImpl(null);
			dao.doUpdateAutoResponse(vo);
			
		}catch(Exception e){
			Logger.error(e.toString());
			msg="Failed to save autoresponse : " + e.getMessage();
		}
		
		return msg;
	}
	
	public AutoResponseVO getAutoResponseByTypeId(long responseTypeId) throws Exception{
		AutoResponseVO vo=null;
		Logger.info("AutoResponseBO.getAutoResponseByTypeId Entering");
		try{ 
			
			AutoResponseDAO dao=new AutoResponseDAOImpl(null);
			vo= dao.getAutoResponseByTypeId(userVO.getId(),responseTypeId);
			
		}catch(Exception e){
			Logger.error(e.toString());
		}
		Logger.info("AutoResponseBO.getAutoResponseByTypeId Leaving");
		return vo;
	}
	
	public AutoResponseVO getAutoResponseById(long responseId) throws Exception{
		AutoResponseVO vo=null;
		try{ 
			
			AutoResponseDAO dao=new AutoResponseDAOImpl(null);
			vo= dao.getAutoResponseById(userVO.getId(),responseId);
			
		}catch(Exception e){
			Logger.error(e.toString());
		}
		
		return vo;
	}
	
	
}

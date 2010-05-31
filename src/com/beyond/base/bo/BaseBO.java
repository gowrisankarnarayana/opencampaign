package com.beyond.base.bo;

import java.sql.Connection;
import java.sql.SQLException;

import com.beyond.base.vo.BaseVO;
import com.beyond.user.vo.UserVO;

public class BaseBO {
	public UserVO userVO=null;
	
	  public BaseBO(UserVO userVO) throws Exception{
		  // @ TODO Implement Constraint: To check if user is allowed to access the business object
		  this.userVO=userVO;
	  }
	  
	  public BaseBO(){
		  
	  }
	  
	  public  boolean rollBack(Connection con)throws Exception{
			
		   try
		   {
			if(con != null && !con.isClosed())
			{
			   con.rollback();
			}
		   }
		   catch(SQLException e)
		   {
			   throw new Exception(e);
		   }
		   return true;
	}
	 
	public void setBaseAttributes(BaseVO vo){
			vo.setIdCreatedBy(userVO.getId());
			vo.setIdModifiedBy(userVO.getId());
			vo.setActive(true);
   }
	  
}

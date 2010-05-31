package com.beyond.base.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import com.beyond.base.dao.BaseDAO;
import com.beyond.base.vo.BaseVO;
import com.beyond.db.ConnectionFactory;
import com.beyond.util.Logger;

public class BaseDAOImpl implements BaseDAO
{
   private Connection con = null;
   
   
   public BaseDAOImpl(Connection conn) throws SQLException 
   {
	   try 
	   {
			 this.con=conn;
			 if(con==null || con.isClosed())
			 {
				con = ConnectionFactory.getConnectionFactory().getDefaultConnection();
			}
		 
			 
		   
	   }
  		catch(SQLException e)
   		{
   			throw new SQLException(e);
   		}
  		catch(Exception e)
   		{
   			throw new SQLException(e);
   		}
	   
    
   }
 
   public Connection getConnection() throws SQLException
   {
	    if(this.con==null || this.con.isClosed())
		 {
			this.con = ConnectionFactory.getConnectionFactory().getDefaultConnection();
		}
		return con;
   }
   
   
   public boolean commitTransactions() throws SQLException 
   {
	   try
	   {
		if(con != null && !con.isClosed())
		{
		   con.commit();
		}
	   }
	   catch(SQLException e)
	   {
		   throw new SQLException(e);
	   }
	   return true;
   }
   
   
   public boolean rollbackTransactions() throws SQLException 
   {
	   try
	   {
		if(con != null && !con.isClosed())
		{
		   con.rollback();
		}
	   }
	   catch(SQLException e)
	   {
		   throw new SQLException(e);
	   }
	   return true;
   }
   
   
   public boolean closeConnection() throws SQLException 
   {
	   try
	   {
		if(con != null && !con.isClosed())
		{
			con.rollback();
			con.close();
		}
	   }
	   catch(SQLException e)
	   {
		   throw new SQLException(e);
	   }
	   return true;
   }
   
   
   public boolean closeStatement(Statement stmt) throws SQLException 
   {
	   try
	   {
	   	if(stmt != null && con != null && !con.isClosed())
	   	{
			stmt.close();
	   	}
	   }
	   catch(SQLException e)
	   {
		   throw new SQLException(e);
	   }
	   return true;
   }
   
  
   public boolean closeResultset(ResultSet resultset) throws SQLException 
   {
	   try
	   {
		if(resultset != null && con != null && !con.isClosed())
		{
			resultset.close();
		}
	   }
	   catch(SQLException e)
	   {
		   throw new SQLException(e);
	   }
	   return true;  
    }
 
 
	
	public String getDateString(java.sql.Date sqlDate, String dateFormat)throws Exception{
		  String formatedDate="";
	        if(null==sqlDate || "".equals(sqlDate)){      
	        	formatedDate=""; 
	        }else{
	        /*1) The content in given String "sqlDate" is in "yyyy-MM-DD hh:mm:ss" pattern.
	       Convert this String object to Date object with the help of SimpleDateFormat*/
	        java.util.Date dateObject = new SimpleDateFormat("yyyy-MM-dd").parse(sqlDate.toString());
	        //2) Apply required pattern on the Date object and store in a String
	        formatedDate = new SimpleDateFormat(dateFormat).format(dateObject);
	        }
	        return  formatedDate;
	} 
	  
	public BaseVO setBaseVOProperties(BaseVO vo,ResultSet rs) throws  SQLException{
		try{ 
			vo.setActive(rs.getInt("IS_ACTIVE")==1?true:true);
		    vo.setCreatedOn( getDateString(rs.getDate("CREATED_ON"),"yyyy-MM-dd"));
			vo.setCreatedBy( rs.getString("CREATED_BY"));
			vo.setModifiedBy(rs.getString("MODIFIED_BY"));
			vo.setModifiedOn(getDateString(rs.getDate("MODIFIED_ON"),"yyyy-MM-dd"));
	 		vo.setIdCreatedBy(rs.getLong("ID_CREATED_BY"));
			vo.setIdModifiedBy(rs.getLong("ID_MODIFIED_BY"));
			return vo;
		}catch(Exception e){
			 Logger.info(e.toString());
			 throw new SQLException(e);
		 }
	}
   
}


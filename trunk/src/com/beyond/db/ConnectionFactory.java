package com.beyond.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.beyond.constants.ApplicationConstants;
import com.beyond.util.Logger;

public class ConnectionFactory  
{
   private static ConnectionFactory conFactory =null;
   Context initContext=null;
   DataSource ds=null;
 
    private ConnectionFactory() throws Exception {
	   Logger.info("Initializing JNDI Resources");
	   initContext = new InitialContext();
	   initContext=(Context) new InitialContext().lookup(ApplicationConstants.COMP_ENVI);
	   ds=(DataSource)initContext.lookup(ApplicationConstants.BEYOND_JNDI);
   }
   
   public static ConnectionFactory getConnectionFactory() throws SQLException
   {
	   try{
    
	    if(conFactory==null){
	    	conFactory=new ConnectionFactory();
	   
	    }
	   }catch(Exception e){
		   Logger.error(e.toString());
		   throw new SQLException(e);
	   }
    	return conFactory;
   }
   
    
    
   public  Connection getDefaultConnection() throws SQLException
   {
	   Connection con =null;
	   try  
		{	 
		  con = ds.getConnection();
		  
	      if(!con.isClosed()){
	        Logger.info("Successfully connected to MySQL server...");
	        con.setAutoCommit(false);   
	      }

	       // private static String connString="jdbc:oracle:thin:OCMAS/OCMAS@//localhost:1521/ORCL";
		   // DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
		   // con=DriverManager.getConnection(connString);
	         
		}  
		catch(Exception e){
			Logger.error("ConnectionFactory.getSQLConnection() : Exception "+e.getMessage());			 
			throw new SQLException(e);
		}
		return con;
   }
   
   
   }

package com.beyond.base.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public interface BaseDAO {
	
	public Connection getConnection() throws SQLException; 
	public boolean commitTransactions() throws SQLException;
	public boolean rollbackTransactions() throws SQLException;
	public boolean closeConnection() throws SQLException ;
	public boolean closeStatement(Statement stmt) throws SQLException;
	public boolean closeResultset(ResultSet resultset) throws SQLException;	 
	
}

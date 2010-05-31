package com.beyond.list.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beyond.base.dao.impl.BaseDAOImpl;
import com.beyond.list.dao.ListDAO;
import com.beyond.list.vo.ListVO;
import com.beyond.util.Logger;

public class ListDAOImpl extends BaseDAOImpl implements ListDAO {

	public ListDAOImpl(Connection conn) throws SQLException {
		super(conn); 
	}

	@Override
	public ListVO doCreateCustomerGroup(ListVO vo) throws SQLException {
		Logger.info("Entering into ListDAO.doCreateCustomerGroup(ListVO)");

		PreparedStatement pstmt = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" insert into customer_groups (user_id,name,group_desc,");
		query.append(" created_by,created_on,modified_by,modified_on,is_active,is_default,");
		query.append(" owners_name, owners_email, replyto_email, notify_owner)");
		query.append(" values(?,?,?,?,sysdate(),?,sysdate(),?,?,?,?,?,?)");
		Logger.info(query.toString());

		try {
			 
			pstmt = getConnection().prepareStatement(query.toString());

			pstmt.setLong(1, vo.getIdCreatedBy());
			pstmt.setString(2,vo.getGroupName());
			pstmt.setString(3,vo.getGroupDesc());
			pstmt.setLong(4,vo.getIdCreatedBy());
			pstmt.setLong(5,vo.getIdModifiedBy());
			pstmt.setInt(6,vo.isActive()?1:0);
			pstmt.setInt(7,vo.isDefaultGroup()?1:0);
			pstmt.setString(8, vo.getOwnersName());
			pstmt.setString(9, vo.getOwnersEmail());
			pstmt.setString(10, vo.getOwnersEmail());
			pstmt.setInt(11, vo.isNotifyOwner()?1:0);
			pstmt.execute();
			Logger.info("ListDAO.doCreateCustomerGroup Committing Transactions");	 	
			commitTransactions();
//			Logger.info("ListDAO.doCreateCustomerGroup Calling getCustomerGroupId to get newly inserted group id");
//			vo.setGroupId(getCustomerGroupId(vo.getGroupName(),vo.getIdCreatedBy()));
			
		} catch (Exception e) {
			Logger.info(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);	
			closeConnection();
		}
		
		return vo;
	}

	@Override
	public void doDeleteGroup(long id, long groupId) throws SQLException {
		Logger.info("ListDAO.doDeleteGroup() Entering");
	 	
		StringBuilder updateSQL= new StringBuilder();
		updateSQL.append("delete from customer_groups where user_id=? and id=?");
	 
		final PreparedStatement pstmt = getConnection().prepareStatement(updateSQL.toString());
		
	 	try
		{
	  		
	 		pstmt.setLong(1, id);
		 	pstmt.setLong(2, groupId);
			pstmt.execute();	
			
			Logger.info("ListDAO doDeleteGroup() Committing Transactions");
			
			commitTransactions();
			
		} catch (Exception e) {
			Logger.info(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);	
			closeConnection();
		}

	}

	@Override
	public Map<Long, Map<Long, ListVO>> getAllGroups() throws SQLException {
		Logger.info("ListDAO.getAllGroups : Entering");
		
		Map<Long,Map<Long, ListVO>> groupMap= new HashMap<Long,Map<Long,ListVO>>(0);
		
		final PreparedStatement pstmt = getConnection().prepareStatement("select id from users");
		try{
		
			final ResultSet rsUsers = pstmt.executeQuery();
			
			while (rsUsers.next()) { 
			/* For each user
			 * 1) Find contacts of the user
			 * 2) Add contacts to map
			 * 3) Add the map to contactMap*/
				
					Long userId=rsUsers.getLong("id");
					
			 		final PreparedStatement psGroups = getConnection().prepareStatement("SELECT * FROM vw_users_customergroups where user_id =?");
			 		Map<Long, ListVO> groups = new HashMap<Long, ListVO>(0);
						
						try{
								psGroups.setLong(1, userId);
								final ResultSet rsGroup = psGroups.executeQuery();
								while (rsGroup.next()) {
									ListVO vo=new ListVO();
									 setBaseVOProperties(vo,rsGroup);
									 vo.setGroupId(rsGroup.getLong("group_id"));
									 vo.setGroupName(rsGroup.getString("group_name"));
									 vo.setGroupDesc(rsGroup.getString("group_desc")); 
									 vo.setCustomerCount(rsGroup.getLong("customerCount"));
									 vo.setOwnersName(rsGroup.getString("owners_name"));
									 vo.setOwnersEmail(rsGroup.getString("owners_email"));
									 vo.setReplyToEmail(rsGroup.getString("replyto_email"));
									 vo.setNotifyOwner(rsGroup.getInt("notify_owner")==1);
									 vo.setDefaultGroup((rsGroup.getInt("is_default")==1));
									 vo.setUserId(userId);
									 groups.put(vo.getGroupId(),vo);
								} 
								Logger.info("CustomerDAO.getAllGroups : Leaving " + groups.size());
								closeResultset(rsGroup);
						} catch (Exception e) {
							Logger.error(e.toString());
							throw new SQLException(e);
						} finally {
							closeStatement(psGroups);
						}
					/* 3) Add the map to contactMap*/	
					groupMap.put(userId, groups);
					Logger.info("User " + userId + " Groups =" + groups.size());
				}
			
			closeResultset(rsUsers);
			} catch (Exception e) {
				Logger.error(e.toString());
				throw new SQLException(e);
			} finally {
			 	closeStatement(pstmt);
				closeConnection();
			}
			
			Logger.info("ListDAO.getAllGroups: Leaving Total Groups : " + groupMap.size());
			return groupMap;
	} 
	
	
	@Override
	public List<ListVO> getGroupsByUserId(long userId) throws SQLException {
		Logger.info("ListDAO.getGroupsByUserId : Entering");
		
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement("SELECT * FROM vw_users_customergroups where user_id =?");
		List<ListVO> groups = new ArrayList<ListVO>(0);
		
		try{
				pstmtCustomers.setLong(1, userId);
				final ResultSet rs = pstmtCustomers.executeQuery();
				while (rs.next()) {
					ListVO vo=new ListVO();
					 setBaseVOProperties(vo,rs);
					 vo.setGroupId(rs.getLong("group_id"));
					 vo.setGroupName(rs.getString("group_name"));
					 vo.setGroupDesc(rs.getString("group_desc"));
					 vo.setCustomerCount(rs.getLong("customerCount"));
					 vo.setOwnersName(rs.getString("owners_name"));
					 vo.setOwnersEmail(rs.getString("owners_email"));
					 vo.setReplyToEmail(rs.getString("replyto_email"));
					 vo.setNotifyOwner(rs.getInt("notify_owner")==1);
					 vo.setDefaultGroup((rs.getInt("is_default")==1));
					 vo.setUserId(userId);
					 groups.add(vo);
				}
				
			Logger.info("ListDAO.getGroupsByUserId : Leaving " + groups.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return groups;
	}

	@Override
	public void setDefaultGroup(long userId, long custGroupId)
			throws SQLException {
		Logger.info("ListDAO.setDefaultGroup() Entering");
		
		StringBuilder updateSQL1= new StringBuilder();
		updateSQL1.append(" update customer_groups set is_default=0 where user_id=? and is_default=1");
		
		StringBuilder updateSQL= new StringBuilder();
		updateSQL.append(" update customer_groups set is_default=1 ");
		updateSQL.append(", modified_by=?, modified_on=sysdate() where user_id=? and id=?");
		
		final PreparedStatement pstmt1 = getConnection().prepareStatement(updateSQL1.toString());
		final PreparedStatement pstmt = getConnection().prepareStatement(updateSQL.toString());
		
	 	try
		{
	 		pstmt1.setLong(1, userId);
		 	pstmt1.execute();		
			
	 		pstmt.setLong(1, userId);
			pstmt.setLong(2, userId);
			pstmt.setLong(3, custGroupId);
			pstmt.execute();	
			
			Logger.info("ListDAO.setDefaultGroup() Committing Transactions");
			
			commitTransactions();
			
		} catch (Exception e) {
			Logger.info(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);	
			closeConnection();
		}
		

	} 
	 
	@Override
	public void doUpdateGroup(ListVO vo) throws SQLException {
		
		Logger.info("ListDAO.doUpdateGroup Entering ");
		Logger.info(vo.toString());
		
		StringBuilder updateSQL= new StringBuilder();
		updateSQL.append(" update customer_groups set name=?, group_desc=?, owners_name=?, owners_email=?, replyto_email=?, notify_owner=?");
		updateSQL.append(", modified_by=?, modified_on=sysdate() where user_id=? and id=?");
		
		final PreparedStatement pstmt = getConnection().prepareStatement(updateSQL.toString());
		 
	 	try
		{
	 	 
	 		pstmt.setString(1, vo.getGroupName());
			pstmt.setString(2, vo.getGroupDesc());
			pstmt.setString(3, vo.getOwnersName());
			pstmt.setString(4, vo.getOwnersEmail());
			pstmt.setString(5, vo.getReplyToEmail());
			pstmt.setInt(6, vo.isNotifyOwner()?1:0);
			pstmt.setLong(7, vo.getUserId());
			pstmt.setLong(8, vo.getUserId());
			pstmt.setLong(9, vo.getGroupId());
			
			pstmt.execute();	
			
			Logger.info("ListDAO.doUpdateGroup() Committing Transactions");
			
			commitTransactions();
			
		} catch (Exception e) {
			Logger.info(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);	
			closeConnection();
		}
		
	}


}

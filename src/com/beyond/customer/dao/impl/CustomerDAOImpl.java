package com.beyond.customer.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.beyond.base.dao.impl.BaseDAOImpl;
import com.beyond.constants.ApplicationConstants;
import com.beyond.customer.dao.CustomerDAO;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class CustomerDAOImpl extends BaseDAOImpl implements CustomerDAO {

	public CustomerDAOImpl(Connection conn) throws SQLException {
		super(conn); 
	}
	
	@Override
	public CustomerVO doCreateCustomer(CustomerVO vo) throws SQLException {
		Logger.info("Entering into CustomerDAO.doCreateUser(UserVO)");
		PreparedStatement pstmt = null;

		StringBuilder query = new StringBuilder();
		query.append(" insert into customers (user_id,title,first_name,last_name, email, contact_details,");
		query.append(" created_by,created_on,modified_by,modified_on,is_active,mobile,landphone,subscription_status_id,group_id,requested_ip,requested_date,confirmed_date,confirmed_ip)");
		query.append(" values(?,?,?,?,?,?,?,sysdate(),?,sysdate(),?,?,?,?,?,?,sysdate(),?,?)");
		Logger.info(query.toString());
		
		try {
 
			pstmt = getConnection().prepareStatement(query.toString());

			pstmt.setLong(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getFirstName());
			pstmt.setString(4, vo.getLastName());
			pstmt.setString(5,vo.getEmail());
			pstmt.setString(6,vo.getContactDetails());
			pstmt.setLong(7, vo.getIdCreatedBy());
			pstmt.setLong(8,vo.getIdModifiedBy());
			pstmt.setInt(9,vo.isActive()?1:0);
			pstmt.setString(10,vo.getMobile());
			pstmt.setString(11,vo.getLandPhone());
			pstmt.setLong(12, vo.getSubscriptionStatus());
			pstmt.setLong(13, vo.getGroupId());
			pstmt.setString(14,vo.getRequestedIP());
			
			if(vo.getSubscriptionStatus()==ApplicationConstants.SUBSCRIPTION_CONFIRMED){
				pstmt.setDate(15, DateUtil.getDate());
			}else{
				pstmt.setObject(15, Types.NULL);
			}
			
			pstmt.setString(16,vo.getConfirmedIP());
			
			pstmt.execute();
			Logger.info("CustomerDAO.doCreateCustomer(CustomerVO) : Sucesfully Created Customer");
			
			commitTransactions();
			closeStatement(pstmt); 
			
			commitTransactions();
			
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
	public CustomerVO doDeleteCustomer(CustomerVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerVO doUpdateCustomer(CustomerVO vo) throws SQLException {
		
		StringBuilder updateSQL= new StringBuilder();
		updateSQL.append(" update customers set title=? ,first_name=?, last_name=?, contact_details=?, email=?, mobile=?, landPhone=?");
		updateSQL.append(", modified_by=?, modified_on=sysdate(), is_active=?, group_id=?  where id=?");
		final PreparedStatement pstmt = getConnection().prepareStatement(updateSQL.toString());
		Logger.info(vo.toJSONString());
		try
		{
			pstmt.setString(1, 	vo.getTitle());
			pstmt.setString(2, 	vo.getFirstName());
			pstmt.setString(3,	vo.getLastName());
			pstmt.setString(4,	vo.getContactDetails());
			pstmt.setString(5, 	vo.getEmail());
			pstmt.setString(6, 	vo.getMobile());
			pstmt.setString(7, 	vo.getLandPhone());
			pstmt.setLong(8, 	vo.getUserId());
			pstmt.setLong(9, 	vo.isActive()?1:0);
			pstmt.setLong(10, 	vo.getGroupId());
			pstmt.setLong(11, 	vo.getCustomerId());
			pstmt.execute();			
			Logger.info("ListVO doUpdateCustomer() Committing Transactions");
			
			commitTransactions();
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
	public CustomerVO getCustomerById(long customerId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomerVO> getCustomersByUserId(long userId)
			throws SQLException {
		Logger.info("CustomerDAO.getCustomersByUserId : Entering");
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_customers where user_id =?");
		List<CustomerVO> customers = new ArrayList<CustomerVO>(0);
		
		try{
				pstmtCustomers.setLong(1, userId);
				
				final ResultSet rs = pstmtCustomers.executeQuery();
				while (rs.next()) {
					CustomerVO vo=new CustomerVO();
					 setCustomerProperties(rs,vo,true);
					 customers.add(vo);
				}
			
			Logger.info("CustomerDAO.getCustomersByUserId : Leaving " + customers.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return customers;
	} 
	
	@Override
	public Set<CustomerVO> getCustomersByMailerId(long mailerId, long userId) throws SQLException {
		Logger.info("CustomerDAO.getCustomersByMailerId : Entering");
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select v.*, m.status_id as mailStatus FROM vw_customers v, mailers_customers m where m.email_id=v.email and m.mailer_id =? and v.user_id=?");
		Set<CustomerVO> customers = new HashSet<CustomerVO>(0);
		
		try{
				pstmtCustomers.setLong(1,mailerId);
				pstmtCustomers.setLong(2,userId);

				final ResultSet rs = pstmtCustomers.executeQuery();
				while (rs.next()) {
					CustomerVO vo=new CustomerVO();
					setCustomerProperties(rs,vo,false); 
					vo.setMailStatus(rs.getInt("mailStatus"));
					customers.add(vo);
				}
			
			Logger.info("CustomerDAO.getCustomersByMailerId : Leaving " + customers.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return customers;
	}
	
	@Override
	public void doDeleteCustomerByEmail(long userId, String email) throws SQLException {
		Logger.info("CustomerDAO.doDeleteCustomerByEmail : Entering");
		PreparedStatement cs = getConnection().prepareStatement("CALL delContact(?,?)");		
		try{
			cs.setLong(1, userId);
			cs.setString(2, email);
			cs.execute();			
			Logger.info("Sucessfully executed delete procedure");
		}catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} 
		closeStatement(cs);
		Logger.info("Leaving CustomerDAO.doDeleteCustomerByEmail");
	}

	@Override
	public CustomerVO getCustomerByEmail(String email, long userId)
			throws SQLException {
		
		Logger.info("CustomerDAO.getCustomerByEmail : Entering");
		
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_customers where user_id =? and email=?");
		CustomerVO vo=null;
		
		try{
				pstmtCustomers.setLong(1, userId);
				pstmtCustomers.setString(2, email);
				
				final ResultSet rs = pstmtCustomers.executeQuery();
				
				while (rs.next()) { 
					 vo=new CustomerVO();
					 setCustomerProperties(rs,vo,false); 
				}
			
			Logger.info("CustomerDAO.getCustomerByEmail : Leaving ");
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return vo;
	}

	 
	
	
	@Override
	public Set<CustomerVO> getCustomersByUserIdAndTerm(long userId,
			String searchCriteria) throws SQLException {
		Logger.info("CustomerDAO.getCustomersByUserId : Entering");
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_customers where user_id =? and (" + searchCriteria +")");
		Set<CustomerVO> customers = new HashSet<CustomerVO>(0);
		
		try{
				pstmtCustomers.setLong(1, userId);
				final ResultSet rs = pstmtCustomers.executeQuery();
				while (rs.next()) {
					CustomerVO vo=new CustomerVO();
					 setCustomerProperties(rs,vo,false);
					 customers.add(vo);
				}
				
			Logger.info("CustomerDAO.getCustomersByUserId : Leaving " + customers.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return customers;
	}
	
	@Override
	public Set<CustomerVO> getCustomersByUserIdAndGroup(long userId,
			String searchCriteria) throws SQLException {
		Logger.info("CustomerDAO.getCustomersByUserIdAndGroup : Entering");
		
		String strQuery="SELECT * FROM vw_customers v where v.user_id =? and (" + searchCriteria +")";
		Logger.info(strQuery);
		
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement(strQuery);
		Set<CustomerVO> customers = new HashSet<CustomerVO>(0);
		
		try{
				pstmtCustomers.setLong(1, userId);
				
				final ResultSet rs = pstmtCustomers.executeQuery();
				while (rs.next()) {
					CustomerVO vo=new CustomerVO();
					setCustomerProperties(rs,vo,false);
					customers.add(vo);
				}
				
				Logger.info("CustomerDAO.getCustomersByUserIdAndGroup : Leaving " + customers.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return customers;
	}
	  
	@Override
	public Map<Long,Map<Long, CustomerVO>>  getAllCustomers() throws SQLException {

		Logger.info("CustomerDAO.getAllCustomers : Entering");
		
		Map<Long,Map<Long, CustomerVO>> contactMap= new HashMap<Long,Map<Long,CustomerVO>>(0);
		
		final PreparedStatement pstmt = getConnection().prepareStatement("select id FROM users");
		try{
		
			final ResultSet rsUsers = pstmt.executeQuery();
			
			while (rsUsers.next()) { 
			/* For each user
			 * 1) Find contacts of the user
			 * 2) Add contacts to map
			 * 3) Add the map to contactMap*/
				
				Long userId=rsUsers.getLong("id");
				final PreparedStatement psContacts = getConnection().prepareStatement("select * FROM vw_customers where user_id=?");
				ResultSet rs=null;
				Map<Long, CustomerVO> contacts= new HashMap<Long, CustomerVO>(0);
					try{
						psContacts.setLong(1, userId);
	 					rs = psContacts.executeQuery();
						while (rs.next()) { 
							CustomerVO vo=new CustomerVO();
							setCustomerProperties(rs,vo,true);
							
							/* 2) Add contacts to map */
							contacts.put(vo.getCustomerId(),vo); 
						} 
					}catch (Exception e) {
						Logger.error(e.toString());
					}finally{
						closeResultset(rs);
						closeStatement(psContacts);
					}
					
				/* 3) Add the map to contactMap*/	
				contactMap.put(userId, contacts);
				Logger.info("User " + userId + " Contact =" + contacts.size());
			}	
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
		 	closeStatement(pstmt);
			closeConnection();
		}
		
		Logger.info("CustomerDAO.getAllCustomers: Leaving Total Customers : " + contactMap.size());
		return contactMap;
	}

	
	@Override
	public Map<Long, CustomerVO> getCustomersMapByUserId(long userId) throws SQLException {
		
		Logger.info("CustomerDAO.getCustomersMapByUserId: Entering");
		
		final PreparedStatement pstmtCustomers = getConnection().prepareStatement("select * FROM vw_customers where user_id =?");
		
		Map<Long, CustomerVO> customers = new HashMap<Long, CustomerVO>(0);
		
		try{
				pstmtCustomers.setLong(1, userId);
				
				final ResultSet rs = pstmtCustomers.executeQuery();
				while (rs.next()) {
					CustomerVO vo=new CustomerVO();
					 setCustomerProperties(rs,vo,true);
					 customers.put(vo.getCustomerId(),vo);
				}
			
			Logger.info("CustomerDAO.getCustomersMapByUserId : Leaving " + customers.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmtCustomers);
			closeConnection();
		}

		return customers;
	}
	
	private synchronized void setCustomerProperties(ResultSet rs, CustomerVO vo,boolean groupsRequired) throws Exception{
			 setBaseVOProperties(vo,rs);
			 vo.setCustomerId(rs.getLong("id"));
			 vo.setTitle(rs.getString("title"));
			 vo.setFirstName(rs.getString("first_name"));
			 vo.setLastName(rs.getString("last_name"));
			 vo.setContactDetails(rs.getString("contact_details"));
			 vo.setEmail(rs.getString("email"));
			 vo.setMobile(rs.getString("mobile"));
			 vo.setLandPhone(rs.getString("landPhone"));
			 vo.setGroupId(rs.getLong("group_id")); 
			 vo.setUserId(rs.getLong("user_id"));
			 vo.setSubscriptionStatus(rs.getInt("subscription_status_id"));	
	} 

}

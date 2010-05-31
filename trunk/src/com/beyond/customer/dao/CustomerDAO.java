package com.beyond.customer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.beyond.base.dao.BaseDAO;
import com.beyond.customer.vo.CustomerVO;
 
public interface CustomerDAO extends BaseDAO {

	public CustomerVO doCreateCustomer(CustomerVO vo) throws  SQLException;
	public CustomerVO doDeleteCustomer(CustomerVO vo) throws  SQLException;
	public CustomerVO doUpdateCustomer(CustomerVO vo) throws  SQLException;
	public void doDeleteCustomerByEmail(long userId, String email)throws  SQLException;
	
	public CustomerVO getCustomerById(long customerId) throws  SQLException;
	public CustomerVO getCustomerByEmail(String email,long userId) throws  SQLException;
	public List<CustomerVO> getCustomersByUserId(long userId) throws  SQLException;
	public Set<CustomerVO> getCustomersByUserIdAndTerm(long id, String searchCriteria) throws SQLException;
	public Set<CustomerVO> getCustomersByUserIdAndGroup(long id, String searchCriteria) throws SQLException;
	public Set<CustomerVO> getCustomersByMailerId(long mailerId,long userId) throws SQLException;
	public Map<Long,Map<Long, CustomerVO>> getAllCustomers() throws SQLException;
	public Map<Long, CustomerVO> getCustomersMapByUserId(long userId) throws SQLException;
	
	
}

/**
 * 
 */
package com.beyond.list.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.beyond.base.dao.BaseDAO;
import com.beyond.list.vo.ListVO;

/**
 * @author gowri
 *
 */
public interface ListDAO extends BaseDAO {

	public ListVO doCreateCustomerGroup(ListVO vo) throws SQLException;
	public void setDefaultGroup(long userId, long custGroupId) throws SQLException;
	public void doDeleteGroup(long id, long groupId) throws SQLException;
	public List<ListVO> getGroupsByUserId(long userId) throws SQLException;
	public Map<Long, Map<Long, ListVO>> getAllGroups() throws SQLException;
	public void doUpdateGroup(ListVO vo) throws SQLException;
	
}

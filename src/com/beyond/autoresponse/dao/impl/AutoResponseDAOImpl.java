/**
 * 
 */
package com.beyond.autoresponse.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.beyond.autoresponse.dao.AutoResponseDAO;
import com.beyond.autoresponse.vo.AutoResponseVO;
import com.beyond.base.dao.impl.BaseDAOImpl;
import com.beyond.util.Logger;

/**
 * @author gowri
 *
 */
public class AutoResponseDAOImpl extends BaseDAOImpl implements AutoResponseDAO {

	public AutoResponseDAOImpl(Connection conn) throws SQLException {
		super(conn); 
	}

	/* (non-Javadoc)
	 * @see com.beyond.autoresponse.dao.AutoResponseDAO#doUpdateAutoResponse(com.beyond.autoresponse.vo.AutoResponseVO)
	 */
	@Override
	public AutoResponseVO doUpdateAutoResponse(AutoResponseVO vo)
			throws SQLException {
		Logger.info("AutoResponseDAO doUpdateAutoResponse() Entering");
		//response_html=?, response_subject=?, template_id=?, modified_by=?, modified_on=sysdate(), is_active=? where user_id=? and id=?
		final PreparedStatement pstmt = getConnection().prepareStatement(AutoResponseDAO.UPDATE_AUTO_RESPONSE);
		Logger.info(vo.toString());
		try
		{
			pstmt.setString(1, 	vo.getAutoResponseHTML());
			pstmt.setString(2, 	vo.getAutoResponseSubject());
			pstmt.setLong(3,	vo.getTemplateId());
 			pstmt.setLong(4, 	vo.getUserId());
			pstmt.setLong(5, 	vo.isActive()?1:0);
			pstmt.setLong(6, 	vo.getUserId());
			pstmt.setLong(7, vo.getAutoResponseId());
			pstmt.execute();			
		    Logger.info("AutoResponseDAO doUpdateAutoResponse() Committing Transactions");
		    
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

	/* (non-Javadoc)
	 * @see com.beyond.autoresponse.dao.AutoResponseDAO#getAutoResponseById(long, long)
	 */
	@Override
	public AutoResponseVO getAutoResponseById(long userId, long autoResponseId)
			throws SQLException {
		Logger.info("AutoResponseDAO.getAutoResponseByTypeId : Entering");
		final PreparedStatement pstmt = getConnection().prepareStatement(AutoResponseDAO.FETCH_BY_USER_AND_ID);
		AutoResponseVO vo=new AutoResponseVO();
		
		try{
				pstmt.setLong(1, userId);
				pstmt.setLong(2, autoResponseId);
				
				final ResultSet rs = pstmt.executeQuery();
						 
				while (rs.next()) {  
					 setBaseVOProperties(vo,rs);
					 setResponderProperties(rs,vo); 
				}
				
			} catch (Exception e) {
				Logger.error(e.toString());
				throw new SQLException(e);
			} finally {
				closeStatement(pstmt);
				closeConnection();
 			}
		Logger.info("AutoResponseDAO.getAutoResponseByTypeId : Leaving");
		return vo;
	}

	/* (non-Javadoc)
	 * @see com.beyond.autoresponse.dao.AutoResponseDAO#getAutoResponseByTypeId(long, long)
	 */
	@Override
	public AutoResponseVO getAutoResponseByTypeId(long userId,
			long autoResponseTypeId) throws SQLException {
		Logger.info("AutoResponseDAO.getAutoResponseByTypeId : Entering");
		final PreparedStatement pstmt = getConnection().prepareStatement(AutoResponseDAO.FETCH_BY_USER_AND_TYPE);
		AutoResponseVO vo=new AutoResponseVO();
		
		try{
				pstmt.setLong(1, userId);
				pstmt.setLong(2, autoResponseTypeId);
				
				final ResultSet rs = pstmt.executeQuery();
						 
				while (rs.next()) {  
					 setBaseVOProperties(vo,rs);
					 setResponderProperties(rs,vo); 
				}
				
			} catch (Exception e) {
				Logger.error(e.toString());
				throw new SQLException(e);
			} finally {
				closeStatement(pstmt);
				closeConnection();
 			}
		Logger.info("AutoResponseDAO.getAutoResponseByTypeId : Leaving");
		return vo;
	}

	private void setResponderProperties(ResultSet rs, AutoResponseVO vo) throws Exception{
		 
		 vo.setAutoResponseId(rs.getLong("id"));
		// vo.setAutoResponseName(rs.getString("response_name"));
		 vo.setAutoResponseType(rs.getString("response_type_name"));
		 vo.setAutoResponseHTML(rs.getString("response_html"));
		 vo.setTemplateId(rs.getLong("template_id"));
		 vo.setAutoResponseSubject(rs.getString("response_subject")); 
		
	}

	/* (non-Javadoc)
	 * @see com.beyond.autoresponse.dao.AutoResponseDAO#getAutoResponseByUserId(long)
	 */
	@Override
	public List<AutoResponseVO> getAutoResponseByUserId(long userId)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}

/**
 * 
 */
package com.beyond.template.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beyond.base.dao.impl.BaseDAOImpl;
import com.beyond.template.dao.TemplateDAO;
import com.beyond.template.vo.ElementVO;
import com.beyond.template.vo.TemplateVO;
import com.beyond.util.Logger;

/**
 * @author gowri
 *
 */
public class TemplateDAOImpl extends BaseDAOImpl implements TemplateDAO {

 
	private static final long serialVersionUID = -7629605132098995790L;

	/**
	 * @param conn
	 * @throws SQLException
	 */
	public TemplateDAOImpl(Connection conn) throws SQLException {
		super(conn);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see com.beyond.template.dao.TemplateDAO#doCreateTemplate(com.beyond.template.vo.TemplateVO)
	 */
	@Override
	public TemplateVO doCreateTemplate(TemplateVO vo) throws SQLException {
		Logger.info("Entering into TemplateDAO.doCreateTemplate(UserVO)");

		PreparedStatement pstmt = null;

		StringBuilder query = new StringBuilder();
		query.append(" insert into templates (user_id,name,content,");
		query.append(" created_by,created_on,modified_by,modified_on,is_active,is_dynamic)");
		query.append(" values(?,?,?,?,sysdate(),?,sysdate(),?,?)");
		Logger.info(query.toString()); 
 
		try {

			pstmt = getConnection().prepareStatement(query.toString());

			pstmt.setLong(1, vo.getUserId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getContent());
			pstmt.setLong(4, vo.getIdCreatedBy());
			pstmt.setLong(5,vo.getIdModifiedBy());
			pstmt.setInt(6,vo.isActive()?1:0);
			pstmt.setInt(7,vo.getDynamic());
			pstmt.execute();
			
			vo.setTemplateId( getTemplateId(vo.getName(),vo.getUserId()));
			
			if(vo.getDynamic()==1){
	 			vo=doCreateElements(vo);
	 		}
			Logger.info("TemplateDAO.doCreateTemplate(TemplateVO) : Sucesfully Created Template"); 
			
			commitTransactions();
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}
		
		return vo;
	}

	/* (non-Javadoc)
	 * @see com.beyond.template.dao.TemplateDAO#doDeleteTemplate(com.beyond.template.vo.TemplateVO)
	 */
	@Override
	public TemplateVO doDeleteTemplate(TemplateVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.beyond.template.dao.TemplateDAO#doUpdateTemplate(com.beyond.template.vo.TemplateVO)
	 */
	@Override
	public TemplateVO doUpdateTemplate(TemplateVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.beyond.template.dao.TemplateDAO#getTemplateById(long)
	 */
	@Override
	public TemplateVO getTemplateById(long templateId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.beyond.template.dao.TemplateDAO#getTemplateByUserAndId(long, long)
	 */
	@Override
	public TemplateVO getTemplateByUserAndId(long userId, long templateId)
			throws SQLException {
		Logger.info("TemplateDAO.getTemplateByUserAndId : Entering");
		final PreparedStatement pstmt = getConnection().prepareStatement("select * from vw_templates where user_id =? and id=?");
		TemplateVO vo=new TemplateVO();
		
		try{
				pstmt.setLong(1, userId);
				pstmt.setLong(2, templateId);
				
				final ResultSet rs = pstmt.executeQuery();
						 
				while (rs.next()) { 
					
					 setBaseVOProperties(vo,rs);
					 setTemplateProperties(rs,vo);
					  
					
				}
				
			} catch (Exception e) {
				Logger.error(e.toString());
				throw new SQLException(e);
			} finally {
				closeStatement(pstmt);
 			}
		Logger.info("TemplateDAO.getTemplateByUserAndId : Leaving");
		return vo;
	}

	/* (non-Javadoc)
	 * @see com.beyond.template.dao.TemplateDAO#getTemplatesByUserId(long)
	 */
	@Override
	public List<TemplateVO> getTemplatesByUserId(long userId)
			throws SQLException {
		Logger.info("TemplateDAO.getTemplatesByUserId : Entering");
		
		final String sqlStr="select * from vw_templates where user_id =?";
		final PreparedStatement pstmt = getConnection().prepareStatement(sqlStr);
		List<TemplateVO> templates = new ArrayList<TemplateVO>(0);
		
		try{
				pstmt.setLong(1, userId);
				final ResultSet rs = pstmt.executeQuery();
						
				while (rs.next()) { 
					TemplateVO vo=new TemplateVO();
					 setBaseVOProperties(vo,rs);
					 setTemplateProperties(rs,vo);
					 templates.add(vo);
				}
			} catch (Exception e) {
				Logger.error(e.toString());
				throw new SQLException(e);
			} finally {
				closeStatement(pstmt);
				closeConnection();
 			}
		Logger.info("TemplateDAO.getTemplatesByUserId : Leaving");
		return templates;
	}

	@Override
	public TemplateVO doCreateElements(TemplateVO template) throws SQLException {
		StringBuilder query= new StringBuilder();
		
		Logger.info("Entering into TemplateDAO.doCreateElements(TemplateVO)");
		
		query.append(" insert into elements( name,label,element_order,max_length,template_id, ");
		query.append(" created_by,created_on,modified_by,modified_on,is_active)");
		query.append(" values(?,?,?,?,?,?,sysdate(),?,sysdate(),?)");
		
		final PreparedStatement pstmt = getConnection().prepareStatement(query.toString());
 
		Logger.info(query.toString()); 
 
		try {
 			
			List<ElementVO> elements= template.getElements();
			
			for(ElementVO vo:elements){
					pstmt.setString(1, vo.getElementName());
					pstmt.setString(2, vo.getElementLabel());
					pstmt.setInt(3, vo.getElementOrder());
					pstmt.setInt(4, vo.getMaxLength());
					pstmt.setLong(5,template.getTemplateId());
					pstmt.setLong(6, template.getIdCreatedBy() );
					pstmt.setLong(7,template.getIdCreatedBy());
					pstmt.setLong(8,template.isActive()?1:0);
					pstmt.execute();
			}
			
			Logger.info("TemplateDAO.doCreateElements(TemplateVO) : Sucesfully Created Template"); 
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);
		}
		
		return template;
	}
	
	public Long getTemplateId(String templateName, long userId) throws SQLException {
		Long templateId=null;
		final String sqlStr="select id from templates where name in(?) and user_id=?";
		final PreparedStatement pstmt = getConnection().prepareStatement(sqlStr);
		try {
			
			pstmt.setString(1, templateName);
			pstmt.setLong(2, userId);
			
			final ResultSet rs = pstmt.executeQuery();
 
			while (rs.next()) {
				templateId=rs.getLong("id");
			}
			closeResultset(rs); 
			
		} catch (Exception e) {
			Logger.info(e.toString());
			throw new SQLException(e );
		} finally{ 
			closeStatement(pstmt);
		}
		Logger.info("TemplateDAO.getTemplateId: TemplateId =" + templateId); 
		return templateId;
	}

	@Override
	public List<ElementVO> getElementsByTemplateId(long templateId) throws SQLException {
		
		Logger.info("TemplateDAO.getElementsByTemplateId : Entering");
		
		final String sqlStr="select * from vw_elements where template_id=?";
		final PreparedStatement pstmt = getConnection().prepareStatement(sqlStr);
		
		List<ElementVO> elements = new ArrayList<ElementVO>(0);
		
		try{
				pstmt.setLong(1, templateId);
				
				final ResultSet rs = pstmt.executeQuery();
						
				while (rs.next()) { 
					 ElementVO vo=new ElementVO(); 
					 setBaseVOProperties(vo,rs);
					 vo.setElementId(rs.getLong("element_id"));
					 vo.setElementName(rs.getString("element_name"));
					 vo.setMaxLength(rs.getInt("max_length"));
					 vo.setElementLabel(rs.getString("element_label"));
					 vo.setElementOrder(rs.getInt("element_order"));
					 vo.setTemplateId(templateId);		 
					 elements.add(vo);
				}
				
			} catch (Exception e) {
				Logger.error(e.toString());
				throw new SQLException(e);
			} finally {
				closeStatement(pstmt);
 			}
			
		Logger.info("TemplateDAO.getElementsByTemplateId - Leaving : Total Elements = " + elements.size());
		return elements;
	}

	@Override
	public Map<Long,Map<Long, TemplateVO>>  getAllTemplates() throws SQLException {

		Logger.info("TemplateDAO.getAllTemplates : Entering");
		
		Map<Long,Map<Long, TemplateVO>> templateMap= new HashMap<Long,Map<Long,TemplateVO>>(0);
		
		final PreparedStatement pstmt = getConnection().prepareStatement("select id FROM users");
		try{
		
			final ResultSet rsUsers = pstmt.executeQuery();
			
			while (rsUsers.next()) { 
			/* For each user
			 * 1) Find contacts of the user
			 * 2) Add contacts to map
			 * 3) Add the map to contactMap*/
				
				Long userId=rsUsers.getLong("id");
				final PreparedStatement psContacts = getConnection().prepareStatement("select * FROM vw_templates where user_id=?");
				ResultSet rs=null;
				Map<Long, TemplateVO> templates= new HashMap<Long, TemplateVO>(0);
					try{
						psContacts.setLong(1, userId);
	 					rs = psContacts.executeQuery();
						while (rs.next()) { 
							TemplateVO vo=new TemplateVO();
							setBaseVOProperties(vo,rs);
							setTemplateProperties(rs,vo); 
				 			templates.put(vo.getTemplateId(),vo); 
						} 
					}catch (Exception e) {
						Logger.error(e.toString());
					}finally{
						closeResultset(rs);
						closeStatement(psContacts);
					}
					
				/* 3) Add the map to contactMap*/	
				templateMap.put(userId, templates);
				Logger.info("User " + userId + " Templates =" + templates.size());
			}	
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
		 	closeStatement(pstmt);
			closeConnection();
		}
		
		Logger.info("CustomerDAO.getAllCustomers: Leaving Total Customers : " + templateMap.size());
		return templateMap;
	}


	private void setTemplateProperties(ResultSet rs, TemplateVO vo)throws Exception{
		 vo.setTemplateId(rs.getLong("id"));
		 vo.setName(rs.getString("name"));
		 vo.setContent(rs.getString("content"));
		 vo.setUserId(rs.getLong("user_id"));
		 vo.setDynamic(rs.getInt("is_dynamic"));
		 vo.setHasElements(rs.getInt("has_elements")==1?true:false);
		 vo.setHasResponses(rs.getInt("has_responses")==1?true:false);
		 vo.setSentCount(rs.getLong("sent_count"));
		 vo.setResponseCount(rs.getLong("response_count"));
		 vo.setLastSentOn(rs.getTimestamp("last_sent_on"));
		 /* If it is dynamic template then fetch elements associated with it */
		 if(vo.getDynamic()==1){
			 vo.setElements(getElementsByTemplateId(vo.getTemplateId()));			 
		 }
	}

	@Override
	public String doDeleteTemplate(long userId, long templateId) throws SQLException {
		Logger.info("TemplateDAO.doDeleteTemplate : Entering");
		PreparedStatement cs = getConnection().prepareStatement("CALL delTemplate(?,?)");		
		try{
			cs.setLong(1, userId);
			cs.setLong(2, templateId);
			cs.execute();			
			Logger.info("Sucessfully executed delete template procedure");
		}catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} 
		closeStatement(cs);
		Logger.info("Leaving TemplateDAO.doDeleteTemplate");
		return "Sucessfully deleted the template";
	}
	
	
}

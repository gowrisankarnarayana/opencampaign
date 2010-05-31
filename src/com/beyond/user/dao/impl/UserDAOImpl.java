package com.beyond.user.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beyond.base.dao.impl.BaseDAOImpl;
import com.beyond.user.dao.UserDAO;
import com.beyond.user.vo.AccountVO;
import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.GroupVO;
import com.beyond.user.vo.MenuVO;
import com.beyond.user.vo.RoleVO;
import com.beyond.user.vo.SubMenuVO;
import com.beyond.user.vo.TaskVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

public class UserDAOImpl extends BaseDAOImpl implements UserDAO {
 
	private static final long serialVersionUID = -4834534656406249182L;

	public UserDAOImpl(Connection conn) throws SQLException {
		super(conn);
	}

	@Override
	public boolean doDeleteUser(long userId) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
 
	@Override
	public UserVO doInsertUser(UserVO userVO) throws SQLException {
		
		Logger.info("UserDAO.doInsertUser()");
		Logger.info(userVO.toString()); 
		UserVO vo = userVO; 
		Logger.info("Entering into UserDAO.doCreateUser"); 
		PreparedStatement pstmt = null; 
		
		try {

			pstmt = getConnection().prepareStatement(USER_INSERT_QUERY);

			pstmt.setString(1, vo.getFirstName());
			pstmt.setString(2, vo.getLastName());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getUserPassword());
			pstmt.execute();
			Logger.info("UserDAO.doCreateUser(UserVO) : Sucesfully Created User");

			/* Obtain newly inserted UserId for further insertions in below mapping tables
			 * 1. User_Groups
			 * 2. User_Accountconfig (Don't really need to set account properties for each user... Please check your logic again)
			 * */
			
			commitTransactions();
			
			vo.setId(getUserId(vo.getUserName(),vo.getEmail()));
			
			pstmt = getConnection().prepareStatement(USER_GROUP_MAPPING_QUERY);
			pstmt.setLong(1, vo.getUserGroupId());
			pstmt.setLong(2, vo.getId() );
			pstmt.execute();
			
			Logger.info("UserDAO.doCreateUser(UserVO) : Sucesfully Mapped User To Group");
			
			commitTransactions();
			
			pstmt = getConnection().prepareStatement(USER_CONFIG_MAPPING_QUERY);
			pstmt.setLong(1, vo.getId());
			pstmt.setString(2, vo.getAccountVO().getCompanyName());
			pstmt.setString(3, vo.getAccountVO().getCompanyNumber());
			pstmt.setLong(4, vo.getIdCreatedBy());
			pstmt.setLong(5, vo.getIdModifiedBy());
			pstmt.execute();
			Logger.info("UserDAO.doCreateUser(UserVO) : Sucesfully Mapped User To Company");
			 
			commitTransactions();
			
		} catch (Exception e) {
			Logger.error(e.toString());
			rollbackTransactions();
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}
		return vo;

	}
 
	@Override
	public List<GroupVO> getGroupVOList(final long userId)
			throws SQLException {
		PreparedStatement pstmt =null;
		try {
			final List<GroupVO> groupVOList = new ArrayList<GroupVO>();
			pstmt= getConnection().prepareStatement(GROUP_FETCH_BY_USER_QUERY);
			pstmt.setLong(1, userId);
			final ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				GroupVO vo = new GroupVO();

				vo = (GroupVO) setBaseVOProperties(vo, rs);
				vo.setGroupId(rs.getLong("GROUP_ID"));
				vo.setGroupName(rs.getString("GROUP_NAME"));
				vo.setGroupDesc(rs.getString("GROUP_DESC"));

				Logger.info(vo.toString());
				vo.setRoleVOList(getRoleVOList(vo.getGroupId()));
				groupVOList.add(vo);
			}
			closeResultset(rs);
			return groupVOList;
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);
		}
	}

	@Override
	public List<RoleVO> getRoleVOList(final long groupId)
			throws SQLException  {
		PreparedStatement pstmt =null;
		try {
			final List<RoleVO> roleVOList = new ArrayList<RoleVO>();
			pstmt = getConnection().prepareStatement(ROLE_FETCH_BY_GROUP_QUERY);
			pstmt.setLong(1, groupId);
			final ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				RoleVO vo = new RoleVO();

				vo = (RoleVO) setBaseVOProperties(vo, rs);

				vo.setRoleId(rs.getLong("ROLE_ID"));
				vo.setRoleName(rs.getString("ROLE_NAME"));
				vo.setRoleDesc(rs.getString("ROLE_DESC"));
				Logger.info(vo.toString());
				vo.setTaskVOList(getTaskVOList(vo.getRoleId()));
				roleVOList.add(vo);
			}
			closeResultset(rs);
			return roleVOList;
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt); 
		}
	}

	@Override
	public List<TaskVO> getTaskVOList(final long roleId)
			throws SQLException  {
		PreparedStatement pstmt =null;
		try {
			final List<TaskVO> taskVOList = new ArrayList<TaskVO>();
			pstmt = getConnection().prepareStatement(TASK_FETCH_BY_ROLE_QUERY);
			pstmt.setLong(1, roleId);
			final ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				TaskVO vo = new TaskVO();

				vo = (TaskVO) setBaseVOProperties(vo, rs);

				vo.setTaskId(rs.getLong("TASK_ID"));
				vo.setTaskName(rs.getString("TASK_NAME"));
				vo.setTaskDesc(rs.getString("TASK_DESC"));
				Logger.info(vo.toString());
				taskVOList.add(vo);
			}
			closeResultset(rs);
			return taskVOList;
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt); 
		}
	}

	@Override
	public List<MenuVO> getMenuVOList(long userId) throws SQLException  {
		PreparedStatement pstmt=null;
		
		try {
			final List<MenuVO> listMenuVO = new ArrayList<MenuVO>();
			pstmt = getConnection().prepareStatement(MENU_FETCH_BY_USER_QUERY);
			pstmt.setLong(1, userId);
			final ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MenuVO vo = new MenuVO();
				vo.setMainMenuId(rs.getLong("main_Menu_Id"));
				vo.setMainMenuName(rs.getString("Main_Menu_Name"));
				vo.setMainMenuLabel(rs.getString("Main_Menu_Label"));
				vo.setMainMenuLink(rs.getString("Main_Menu_Link"));
				vo.setMainMenuImage(rs.getString("image_link"));
				Logger.info(vo.toString());
				vo.setListSubMenu(getSubMenuVOList(userId, vo.getMainMenuId()));
				listMenuVO.add(vo);
			}

			Logger.info("UserDAOImpl.getMenuVOList Total Menu VO's : " + listMenuVO.size());
			//Collections.sort(listMenuVO);
			closeResultset(rs);
			return listMenuVO;
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt); 
		}
	}
    
	@Override
	public List<SubMenuVO> getSubMenuVOList(long userId, long mainMenuId)
			throws SQLException  {
		PreparedStatement pstmt =null;
		try {
			final List<SubMenuVO> listMenuVO = new ArrayList<SubMenuVO>();
			pstmt = getConnection().prepareStatement(SUB_MENU_FETCH_BY_USER_QUERY);
			pstmt.setLong(1, userId);
			pstmt.setLong(2, mainMenuId);
			final ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				SubMenuVO vo = new SubMenuVO();
				vo.setSubMenuId(rs.getLong("SUB_MENU_ID"));
				vo.setSubMenuName(rs.getString("SUB_MENU_NAME"));
				vo.setSubMenuDesc(rs.getString("SUB_MENU_DESC"));
				vo.setSubMenuLabel(rs.getString("SUB_MENU_LABEL"));
				vo.setSubMenuLink(rs.getString("SUB_MENU_LINK"));
				vo.setMainMenuId(mainMenuId);
				Logger.info(vo.toString());
				listMenuVO.add(vo);
			}

			Logger.info("UserDAOImpl.getSubMenuVOList Total Menu VO's : "
					+ listMenuVO.size());
			closeResultset(rs);
			//Collections.sort(listMenuVO);
			return listMenuVO;
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt); 
		}
	}

	
	@Override
	public UserVO doUpdateUser(UserVO vo) throws SQLException {
		
		Logger.info("Entering UserDAO.doUpdateUser " + vo);
		
		StringBuilder updateSQL= new StringBuilder();
		updateSQL.append(" update users set title=? ,first_name=?, last_name=?,  email=?, mobile=?, land_Phone=?");
		updateSQL.append(", modified_by=?, modified_on=sysdate(), is_active=? where id=?");
		
		StringBuilder accntSQL= new StringBuilder();
		accntSQL.append(" update user_accountconfig set company_name=? , company_number=?, company_address=?,  company_phone=?");
		accntSQL.append(", modified_by=?, modified_on=sysdate(), is_active=? where user_id=?");
		
		final PreparedStatement pstmt = getConnection().prepareStatement(updateSQL.toString());
		final PreparedStatement pstmt1 = getConnection().prepareStatement(accntSQL.toString());   
		
		try
		{
			Logger.info("UserDAO.doUpdateUser Updating UserVO :" + vo.toString());
			
			pstmt.setString(1, 	vo.getTitle());
			pstmt.setString(2, 	vo.getFirstName());
			pstmt.setString(3,	vo.getLastName());
		 	pstmt.setString(4, 	vo.getEmail());
			pstmt.setString(5, 	vo.getMobile());
			pstmt.setString(6, 	vo.getLandPhone());
			pstmt.setLong(7, 	vo.getIdModifiedBy());
			pstmt.setLong(8, 	vo.isActive()?1:0);
			pstmt.setLong(9, 	vo.getId());
			
			pstmt.executeUpdate();
			
			commitTransactions();
			
			Logger.info("UserDAO.doUpdateUser Updating AccountVO");
			AccountVO avo= vo.getAccountVO();
			
			pstmt1.setString(1, avo.getCompanyName());
			pstmt1.setString(2, avo.getCompanyNumber());
			pstmt1.setString(3,	avo.getCompanyAddress());
			pstmt1.setString(4, avo.getCompanyPhone());
			pstmt1.setLong(5, vo.getIdModifiedBy());
			pstmt1.setLong(6, vo.isActive()?1:0);
			pstmt1.setLong(7, vo.getId());
			pstmt1.executeUpdate();			
			
			Logger.info("UserDAO doUpdateUser() Committing Transactions");
			
			commitTransactions();
		} catch (Exception e) {
			Logger.info(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);
			closeStatement(pstmt1);
			closeConnection();
		}
		
		return vo;
	}
 

	@Override
	public UserVO getUserByUserId(long userId) throws SQLException {
		 PreparedStatement pstmt=null;
		try {
			pstmt = getConnection().prepareStatement(USER_FETCH_BY_ID_QUERY);
			pstmt.setLong(1, userId);
			final ResultSet rs = pstmt.executeQuery();
			UserVO vo = new UserVO();
			
			while (rs.next()) {
				vo = (UserVO) setBaseVOProperties(vo, rs);
				 
				setUserProperties(vo,rs);
				Logger.info("User : " + vo);
				
				vo.setListGroupVO(getGroupVOList(userId));
				vo.setListMenuVO(getMenuVOList(userId));
			}
			Logger.info("AuthDAO.getUserVO: User Info =" + vo.toString());
			closeResultset(rs);
			return vo;
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}
	}
	private void setUserProperties(UserVO vo, ResultSet rs) throws Exception{
		
		vo.setId(rs.getLong("ID"));
	 	vo.setTitle(rs.getString("TITLE"));
		vo.setFirstName(rs.getString("FIRST_NAME"));
		vo.setLastName(rs.getString("LAST_NAME"));
		vo.setEmail(rs.getString("EMAIL"));
		vo.setLandPhone(rs.getString("LAND_PHONE"));
		vo.setMobile(rs.getString("MOBILE"));
		vo.setUserName(rs.getString("USER_NAME"));
		vo.setUserTypeId(rs.getInt("USER_TYPE_ID"));
		
		AccountVO avo=new AccountVO();
		avo.setCompanyName(rs.getString("COMPANY_NAME"));
		avo.setCompanyNumber(rs.getString("COMPANY_NUMBER"));
		avo.setCompanyAddress(rs.getString("COMPANY_ADDRESS"));
		avo.setCompanyPhone(rs.getString("COMPANY_PHONE")); 
		vo.setAccountVO(avo);
		
	}
	@Override
	public List<UserVO> getAllUsers() throws SQLException{
		PreparedStatement pstmt=null;
		List<UserVO> users= new ArrayList<UserVO>(0);
		try {
			pstmt = getConnection().prepareStatement(ALL_USER_QUERY);
		 	final ResultSet rs = pstmt.executeQuery(); 
			
			while (rs.next()) {
				UserVO vo = new UserVO();
			  	vo = (UserVO) setBaseVOProperties(vo, rs);
					setUserProperties(vo,rs);
					vo.setListGroupVO(getGroupVOList(vo.getId()));
					vo.setListMenuVO(getMenuVOList(vo.getId()));
				users.add(vo);
			}
			
			Logger.info("UserDAODAO.getAllUsers: Total Users =" + users.size());
			closeResultset(rs); 
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}
		return users; 
	}
	
	@Override
	public List<UserVO> getUsersByGroupId(long groupId)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long getUserId(String userName, String email) throws SQLException {
		Long userId=null;
		PreparedStatement pstmt=null;
		try {
			pstmt = getConnection().prepareStatement(USER_ID_FETCH_BY_MAIL_QUERY);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			final ResultSet rs = pstmt.executeQuery();
 
			while (rs.next()) {
				userId=rs.getLong("ID");
			}
			closeResultset(rs);
			Logger.info("AuthDAO.getUserVO: User Id =" + userId);
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}
		return userId;
	}

	@Override
	public long isValidUser(String email, String password)
			throws SQLException {
		long userId=-1;
		PreparedStatement pstmt =null;
		try {
			pstmt = getConnection().prepareStatement(USER_AUTH_QUERY);
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			final ResultSet rs = pstmt.executeQuery(); 
			while (rs.next()) {
				userId=rs.getLong("ID"); 
			}
			closeResultset(rs);
			Logger.info("UserDAO.isValidUser:  " + userId); 
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e );
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}
		return userId;
	}

	@Override
	public EmailProfileVO doCreateMailProfile(EmailProfileVO vo)
			throws SQLException {
		Logger.info("Entering into UserDAO.doCreateMailProfile(EmailProfileVO)" + vo.toString());

		PreparedStatement pstmt = null;
		
		StringBuilder query = new StringBuilder();
		query.append(" insert into user_mailconfig(profile_name,user_id,smtp_auth,smtp_servername,smtp_username,smtp_password,smtp_port,from_email,replyto_email,from_name,");
		query.append(" created_by,created_on,modified_by,modified_on,is_active)");
		query.append(" values(?,?,?,?,?,?,?,?,?,?,?,sysdate(),?,sysdate(),?)");
		Logger.info(query.toString());

		try {
			 
			pstmt = getConnection().prepareStatement(query.toString());
			pstmt.setString(1, vo.getProfileName());
			pstmt.setLong(2,vo.getUserId()); 
			pstmt.setString(3,vo.getSmtpAuth());
			pstmt.setString(4,vo.getSmtpHost());
			pstmt.setString(5,vo.getSmtpUser());
			pstmt.setString(6, vo.getSmtpPassword());
			pstmt.setString(7, vo.getSmtpPort());
			pstmt.setString(8, vo.getFromAddress());
			pstmt.setString(9, vo.getReplyToEmail());
			pstmt.setString(10, vo.getSmtpFromName());
			pstmt.setLong(11,vo.getIdCreatedBy());
			pstmt.setLong(12,vo.getIdCreatedBy());
			pstmt.setInt(13,vo.isActive()?1:0);
			pstmt.execute();
			
			Logger.info("UserDAO.doCreateMailProfile() Committing Transactions");	 	
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
	public EmailProfileVO getMailProfileById(long profileId) throws SQLException {
		Logger.info("UserDAO.getMailProfileById : Entering");
		final PreparedStatement pstmt = getConnection().prepareStatement("SELECT * from vw_user_mailprofiles where id=?");
		EmailProfileVO vo = new EmailProfileVO();
		
		try{
				pstmt.setLong(1, profileId); 
				final ResultSet rs = pstmt.executeQuery();
				while (rs.next()) { 
					setBaseVOProperties(vo, rs); 
					Logger.info("Profile Name :" + rs.getString("profile_name"));
					vo.setProfileName(rs.getString("profile_name"));
					vo.setProfileId(rs.getLong("id"));
					vo.setMailConfigId(rs.getLong("id"));
					vo.setUserId(rs.getLong("user_id")); 
					vo.setSmtpFromName(rs.getString("from_name"));
					vo.setFromAddress(rs.getString("from_email"));
					vo.setSmtpUser(rs.getString("smtp_username"));
					vo.setSmtpHost(rs.getString("smtp_servername"));
					vo.setSmtpPassword(rs.getString("smtp_password"));
					vo.setSmtpPort(rs.getString("smtp_port"));					
					vo.setReplyToEmail(rs.getString("replyto_email")); 
					vo.setSmtpAuth(rs.getString("smtp_auth"));  
					Logger.info(vo.toString());
				}
				
			Logger.info("UserDAO.getMailProfileByUserId : Leaving ");
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}

		return vo;
	}

	@Override
	public List<EmailProfileVO> getMailProfileByUserId(long userId) throws SQLException {
		Logger.info("UserDAO.getMailProfileByUserId : Entering");
		final PreparedStatement pstmt = getConnection().prepareStatement("SELECT * from vw_user_mailprofiles where user_id=?");
		List<EmailProfileVO> profiles = new ArrayList<EmailProfileVO>(0);
		
		try{
				pstmt.setLong(1, userId);
				final ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					EmailProfileVO vo=new EmailProfileVO();
					setBaseVOProperties(vo, rs); 
					Logger.info("Profile Name :" + rs.getString("profile_name"));
					vo.setProfileName(rs.getString("profile_name"));
					vo.setProfileId(rs.getLong("id"));
					vo.setMailConfigId(rs.getLong("id"));
					vo.setUserId(rs.getLong("user_id")); 
					vo.setSmtpFromName(rs.getString("from_name"));
					vo.setFromAddress(rs.getString("from_email"));
					vo.setSmtpUser(rs.getString("smtp_username"));
					vo.setSmtpHost(rs.getString("smtp_servername"));
					vo.setSmtpPassword(rs.getString("smtp_password"));
					vo.setSmtpPort(rs.getString("smtp_port"));					
					vo.setReplyToEmail(rs.getString("replyto_email")); 
					vo.setSmtpAuth(rs.getString("smtp_auth")); 
					profiles.add(vo);
					Logger.info(vo.toString());
				}
				
			Logger.info("UserDAO.getMailProfileByUserId : Leaving " + profiles.size());
			
		} catch (Exception e) {
			Logger.error(e.toString());
			throw new SQLException(e);
		} finally {
			closeStatement(pstmt);
			closeConnection();
		}

		return profiles;
	}

}


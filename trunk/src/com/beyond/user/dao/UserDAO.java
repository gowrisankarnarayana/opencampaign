package com.beyond.user.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.GroupVO;
import com.beyond.user.vo.MenuVO;
import com.beyond.user.vo.RoleVO;
import com.beyond.user.vo.SubMenuVO;
import com.beyond.user.vo.TaskVO;
import com.beyond.user.vo.UserVO;


public interface UserDAO extends Serializable {
	
	public String GROUP_FETCH_BY_USER_QUERY = "select group_id,group_name,group_desc,is_active,created_on,created_by,modified_on,modified_by, id_created_by, id_modified_by  from vw_groups_users where user_id in(?)"; 
	public String ROLE_FETCH_BY_GROUP_QUERY = "select role_id,role_name,role_desc,is_active,created_on,created_by,modified_on,modified_by , id_created_by, id_modified_by from vw_groups_roles where group_id in(?)";
	public String TASK_FETCH_BY_ROLE_QUERY  = "select task_id,task_name,task_desc,is_active,created_on,created_by,modified_on,modified_by , id_created_by, id_modified_by from vw_roles_tasks where role_id in(?)";
	public String MENU_FETCH_BY_USER_QUERY  = "select distinct main_menu_id,main_menu_name, main_menu_label,main_menu_link,image_link from vw_user_menu where user_id in(?)";
	public String SUB_MENU_FETCH_BY_USER_QUERY= "select distinct sub_menu_id,sub_menu_name,sub_menu_label,sub_menu_link,sub_menu_desc from vw_user_menu where user_id in(?) and main_menu_id in(?) order by submenu_order";
	public String USER_FETCH_BY_ID_QUERY ="select * from vw_users where  id in(?)";
	public String USER_ID_FETCH_BY_MAIL_QUERY = "select id from users where user_name in(?) and email in (?) ";
	public String USER_AUTH_QUERY= "select id from users where password in(?) and email in (?) ";
	public String USER_INSERT_QUERY=" insert into users (first_name,last_name,user_name,email,password,user_type_id,created_by,created_on,modified_by,modified_on,is_active)values(?,?,?,?,?,2,2,sysdate(),2,sysdate(),0)";
	public String USER_GROUP_MAPPING_QUERY="insert into groups_users ( group_id, user_id,created_by,created_on,modified_by,modified_on,is_active) values(?,?,0,sysdate(),0,sysdate(),1)";
	public String USER_CONFIG_MAPPING_QUERY="insert into user_accountconfig (user_id,company_name,company_number, is_authorized,created_by,created_on,modified_by,modified_on,is_active) values(?,?,?,0,?,sysdate(),?,sysdate(),1)";
	
	public String ALL_USER_QUERY="select * from vw_users";
	
	public UserVO doInsertUser(UserVO userVO) throws SQLException;
	public UserVO doUpdateUser(UserVO userVO) throws SQLException;
	public boolean doDeleteUser(long userId) throws SQLException;
	public EmailProfileVO doCreateMailProfile(EmailProfileVO vo) throws SQLException;
	
	public long isValidUser(String email, String password) throws SQLException;
	public UserVO getUserByUserId(long userId) throws SQLException;
	public Long getUserId(String userName, String email) throws SQLException;
	public List<UserVO> getUsersByGroupId(long groupId) throws SQLException;
	public List<UserVO> getAllUsers() throws SQLException;
	List<GroupVO> getGroupVOList(long userId) throws SQLException;
	List<RoleVO> getRoleVOList(long groupId) throws SQLException;
	List<TaskVO> getTaskVOList(long roleId) throws SQLException;
	List<MenuVO> getMenuVOList(long userId) throws SQLException;
	List<SubMenuVO> getSubMenuVOList(long userId, long mainMenuId) throws SQLException;
	public List<EmailProfileVO> getMailProfileByUserId(long userId) throws SQLException;
	public EmailProfileVO getMailProfileById(long profileId) throws SQLException;
	
}

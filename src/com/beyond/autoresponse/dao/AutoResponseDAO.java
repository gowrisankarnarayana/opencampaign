package com.beyond.autoresponse.dao;

import java.sql.SQLException;
import java.util.List;

import com.beyond.autoresponse.vo.AutoResponseVO;
import com.beyond.base.dao.BaseDAO;

public interface AutoResponseDAO extends BaseDAO {

	public static String FETCH_BY_USER = "select * from vw_auto_responses where user_id=?";
	public static String FETCH_BY_USER_AND_ID = "select * from vw_auto_responses where user_id=? and id=?";
	public static String FETCH_BY_USER_AND_TYPE = "select * from vw_auto_responses where user_id=? and response_type_id=?";
	
	public static String UPDATE_AUTO_RESPONSE="update auto_responses set response_html=?, response_subject=?, template_id=?, modified_by=?, modified_on=sysdate(), is_active=? where user_id=? and id=?";
	
	public List<AutoResponseVO> getAutoResponseByUserId(long userId) throws SQLException;
	public AutoResponseVO getAutoResponseById(long userId, long autoResponseId) throws SQLException;
	public AutoResponseVO getAutoResponseByTypeId(long userId, long autoResponseTypeId) throws SQLException;
	public AutoResponseVO doUpdateAutoResponse(AutoResponseVO vo) throws SQLException;
	
	
}

package com.beyond.template.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.beyond.base.dao.BaseDAO;
import com.beyond.template.vo.ElementVO;
import com.beyond.template.vo.TemplateVO;

public interface TemplateDAO extends Serializable, BaseDAO{

	public TemplateVO doCreateTemplate(TemplateVO vo) throws  SQLException;
	public TemplateVO doCreateElements(TemplateVO vo) throws  SQLException;
	
	public TemplateVO doDeleteTemplate(TemplateVO vo) throws  SQLException;
	public TemplateVO doUpdateTemplate(TemplateVO vo) throws  SQLException;
	public String doDeleteTemplate(long userId,long templateId) throws SQLException;
	
	public TemplateVO getTemplateById(long templateId) throws  SQLException;
	public TemplateVO getTemplateByUserAndId(long userId, long templateId) throws  SQLException;
	public List<TemplateVO> getTemplatesByUserId(long userId) throws  SQLException;
	
	public List<ElementVO> getElementsByTemplateId(long templateId) throws SQLException;
	public  Map<Long, Map<Long, TemplateVO>> getAllTemplates() throws SQLException;
	
}
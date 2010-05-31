package com.beyond.template.cache;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beyond.base.cache.BaseCache;
import com.beyond.constants.ApplicationConstants;
import com.beyond.template.dao.TemplateDAO;
import com.beyond.template.dao.impl.TemplateDAOImpl;
import com.beyond.template.vo.TemplateVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class TemplateCache extends BaseCache implements Serializable {

	private static final long serialVersionUID = -1922455550230877897L;
	private static Map<Long,Map<Long, TemplateVO>> templateMap= new HashMap<Long,Map<Long,TemplateVO>>(0);
	private static String status= ApplicationConstants.CACHE_NOT_INITIALIZED;
	private static Date lastRefreshed=null; 
	
	@Override
	public long getSize() {
		return templateMap.size();
	}
 
	@Override
	public String getStatus() {
		return status;
	}

	@Override
	public String getName() {
	  return "TemplateCache";
	}

	@Override
	public Date getLastRefreshed() {
		return lastRefreshed;
	}

	@Override
	public void refreshCache(Long id) {
		// TODO Auto-generated method stub 
	}

	@Override
	public void initialize() {
		try{
			
			if(!status.equalsIgnoreCase(ApplicationConstants.CACHE_INITIALIZED)){
				
				status= ApplicationConstants.CACHE_INITIALIZATION_IN_PROGRESS;
				
				TemplateDAO dao=new TemplateDAOImpl(null);		
				Map<Long,Map<Long, TemplateVO>> templates=dao.getAllTemplates();
			
				templateMap.putAll(templates);
				
				dao=null;
				
				status=ApplicationConstants.CACHE_INITIALIZED;
				lastRefreshed= DateUtil.getCurrentTime();
				Logger.info("TemplateCache Count :" + templates.size());
			}
		
		}catch(Exception e){
			status=ApplicationConstants.CACHE_INITIALIZATION_ERROR + e.getMessage();
			Logger.error("TemplateCache failed to load templates :" + e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public void refresh() {
		// TODO Auto-generated method stub 
	}

	public static List<TemplateVO> getTemplatesByUserId(Long id) throws Exception{
		List<TemplateVO> templates=null;
		 if(templateMap.containsKey(id)){
			 templates=new ArrayList<TemplateVO>(templateMap.get(id).values());
		 }
		 if(templates==null){
			 TemplateDAO dao= new TemplateDAOImpl(null);
			 templates=dao.getTemplatesByUserId(id);
			 dao=null;
		 }
		 return templates;
	}

	public static TemplateVO doCreateTemplate(TemplateVO templateVO) throws Exception{
		
		TemplateDAO dao= new TemplateDAOImpl(null);
		templateVO=dao.doCreateTemplate(templateVO);
		dao=null;
		//if(templateMap.containsKey(templateVO.getUserId())){
			//templateMap.get(templateVO.getUserId()).put(templateVO.getTemplateId(), templateVO);
		 //}
		 
		return templateVO;
	}

	public static String deleteTemplate(long id, long templateId) throws Exception{
		TemplateDAO dao=new TemplateDAOImpl(null);
		return dao.doDeleteTemplate(id, templateId);		
	}
	
	

}

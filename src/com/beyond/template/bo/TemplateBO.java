/**
 * 
 */
package com.beyond.template.bo;

import java.util.ArrayList;
import java.util.List;

import com.beyond.base.bo.BaseBO;
import com.beyond.constants.ValidationConstants;
import com.beyond.template.cache.TemplateCache;
import com.beyond.template.vo.TemplateHolderVO;
import com.beyond.template.vo.TemplateVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

/**
 * @author gowri
 *
 */
public class TemplateBO extends BaseBO {
	/**
	 * @param userVO
	 * @throws Exception
	 */
	public TemplateBO(UserVO userVO) throws Exception {
		super(userVO);
	}
	
	public TemplateVO createTemplate(TemplateVO templateVO) throws Exception{
		Logger.info("TemplateBO.createTemplate() Template Name : " + templateVO.getName());
		
		validate(templateVO);
		
		try{
			
			setBaseAttributes(templateVO);
		 	templateVO.setUserId(userVO.getId());
		 	templateVO=TemplateCache.doCreateTemplate(templateVO); 
	 	 	Logger.info("TemplateBO.createTemplate() Template Created Sucessfully");
	 	
		}catch(Exception e){
			Logger.error(e.toString());
			throw new Exception(e);
		}
		Logger.info(templateVO.toString());
		return templateVO;
	}
	
	public TemplateHolderVO getUserTemplates() throws Exception{
		
		Logger.info("TemplateBO.getUserTemplates()");
		
		TemplateHolderVO holder=new TemplateHolderVO ();
		
		List<TemplateVO> templates=new ArrayList<TemplateVO>(0);
		List<TemplateVO> staticTemplates=new ArrayList<TemplateVO>(0);
		List<TemplateVO> dynamicTemplates=new ArrayList<TemplateVO>(0);
		
		try{
			 //templates=dao.getTemplatesByUserId(userVO.getId());
			templates=TemplateCache.getTemplatesByUserId(userVO.getId());
  	 		 for(TemplateVO vo:templates){
  	 			if(vo.getDynamic()==1){
  	 				dynamicTemplates.add(vo);
  				 }else{
  					staticTemplates.add(vo);
  				 }
  	 		 }
			 	
  	 		 holder.setStaticTemplates(staticTemplates);
			 holder.setDynamicTemplates(dynamicTemplates);
			 	
	 	Logger.info("TemplateBO.getUserTemplates() Templates Read Sucessfully");
	 	
		}catch(Exception e){
			Logger.error(e.toString());
			throw new Exception(e);
		}
		Logger.info(holder.toString());
		return holder;
		
	}
	
	public void validate(TemplateVO templateVO) throws Exception{
		
		if(templateVO.getName()==null || templateVO.getName().equals(ValidationConstants.EMPTY_STRING)){
			throw new Exception(ValidationConstants.TEMPLATE_NAME_MANDATORY);
		}
		
		if(templateVO.getContent()==null || templateVO.getContent().equals(ValidationConstants.EMPTY_STRING)){
			throw new Exception(ValidationConstants.TEMPLATE_CONTENT_MANDATORY);
		}

	}

	public String deleteTemplate(long templateId) throws Exception {
		 return TemplateCache.deleteTemplate(userVO.getId(),templateId);
	}
	
}

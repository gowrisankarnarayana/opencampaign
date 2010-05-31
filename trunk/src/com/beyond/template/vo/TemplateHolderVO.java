package com.beyond.template.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TemplateHolderVO implements Serializable {

 	private static final long serialVersionUID = -5525900619705704493L;
	
	private List<TemplateVO> dynamicTemplates=new ArrayList<TemplateVO>(0);
	private List<TemplateVO> staticTemplates=new ArrayList<TemplateVO>(0);
	
	public List<TemplateVO> getDynamicTemplates() {
		return dynamicTemplates;
	}
	public void setDynamicTemplates(List<TemplateVO> dynamicTemplates) {
		this.dynamicTemplates = dynamicTemplates;
	}
	public List<TemplateVO> getStaticTemplates() {
		return staticTemplates;
	}
	public void setStaticTemplates(List<TemplateVO> staticTemplates) {
		this.staticTemplates = staticTemplates;
	}
	public List<TemplateVO> getTemplates(int typeId) {
		List<TemplateVO> templates=null;
		switch(typeId){
		case 0:  templates=getStaticTemplates(); break; 
		case 1:  templates=getDynamicTemplates(); break;
		 }
		return templates;
	}
	
	
}

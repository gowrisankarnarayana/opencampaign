package com.beyond.customer.vo;

import com.beyond.base.vo.BaseVO;

public class SubscriptionVO extends BaseVO {
 
	private static final long serialVersionUID = 1L;
	
	private String formName;
	private String formHTML;
	private String[] formFields;
	
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getFormHTML() {
		return formHTML;
	}
	public void setFormHTML(String formHTML) {
		this.formHTML = formHTML;
	}
	public String[] getFormFields() {
		return formFields;
	}
	public void setFormFields(String[] formFields) {
		this.formFields = formFields;
	}
	
	

}

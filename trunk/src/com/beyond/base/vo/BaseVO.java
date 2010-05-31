package com.beyond.base.vo;

import java.io.Serializable;

import org.apache.struts.action.ActionForm;

import com.beyond.util.BeyondError;

public class BaseVO extends ActionForm implements Serializable {

	private long   idCreatedBy;
	private long   idModifiedBy;
	private String createdBy;
	private String createdOn;
	private String modifiedBy;
	private String modifiedOn;
	private boolean isActive;
	
	private boolean errorFlag;
	private String actionMessage;
	
	private BeyondError errors=new BeyondError();
	
	public long getIdCreatedBy() {
		return idCreatedBy;
	}
	public void setIdCreatedBy(long idCreatedBy) {
		this.idCreatedBy = idCreatedBy;
	}
	public long getIdModifiedBy() {
		return idModifiedBy;
	}
	public void setIdModifiedBy(long idModifiedBy) {
		this.idModifiedBy = idModifiedBy;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public String getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(String modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	private static final long serialVersionUID = 1L;

	public boolean isErrorFlag() {
		return errorFlag;
	}
	public void setErrorFlag(boolean errorFlag) {
		this.errorFlag = errorFlag;
	}
	public String getActionMessage() {
		return actionMessage;
	}
	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}
	public BeyondError getErrors() {
		return errors;
	}
	public void setErrors(BeyondError errors) {
		this.errors = errors;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (idCreatedBy ^ (idCreatedBy >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BaseVO other = (BaseVO) obj;
		if (idCreatedBy != other.idCreatedBy)
			return false;
		return true;
	}
	
	 

}

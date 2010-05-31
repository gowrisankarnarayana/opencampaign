package com.beyond.template.vo;

import com.beyond.base.vo.BaseVO;

public class ElementVO extends BaseVO implements Comparable<ElementVO>{

 
	private static final long serialVersionUID = 8138475505854756467L;
	
	private long 	elementId;
	private String  elementName;
	private String  elementLabel;
	private String  elementType;
	private String  elementValue;
	private int 	maxLength;
	private int 	elementOrder;
	private boolean ignored;
	
	private long templateId;
	
	public String getElementName() {
		return elementName;
	}
	public void setElementName(String elementName) {
		this.elementName = elementName;
	}
	public String getElementType() {
		return elementType;
	}
	public void setElementType(String elementType) {
		this.elementType = elementType;
	}
	public int getMaxLength() {
		return maxLength;
	}
	public void setMaxLength(int maxLength) {
		this.maxLength = maxLength;
	}
	public int getElementOrder() {
		return elementOrder;
	}
	public void setElementOrder(int elementOrder) {
		this.elementOrder = elementOrder;
	}
	public boolean isIgnored() {
		return ignored;
	}
	public void setIgnored(boolean ignored) {
		this.ignored = ignored;
	}
	public String getElementLabel() {
		return elementLabel;
	}
	public void setElementLabel(String elementLabel) {
		this.elementLabel = elementLabel;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ElementVO [elementLabel=");
		builder.append(elementLabel);
		builder.append(", elementName=");
		builder.append(elementName);
		builder.append(", elementOrder=");
		builder.append(elementOrder);
		builder.append(", elementType=");
		builder.append(elementType);
		builder.append(", ignored=");
		builder.append(ignored);
		builder.append(", maxLength=");
		builder.append(maxLength);
		builder.append("]");
		return builder.toString();
	}
	public long getElementId() {
		return elementId;
	}
	public void setElementId(long elementId) {
		this.elementId = elementId;
	}
	public long getTemplateId() {
		return templateId;
	}
	public void setTemplateId(long templateId) {
		this.templateId = templateId;
	}
	 
	@Override
	public int compareTo(ElementVO arg0) {
		int ev2Order = arg0.getElementOrder();
		
		if( this.elementOrder > ev2Order )
			return 1;
		else if( this.elementOrder < ev2Order )
			return -1;
		else
			return 0; 
		
	}
	public String getElementValue() {
		return elementValue;
	}
	public void setElementValue(String elementValue) {
		this.elementValue = elementValue;
	}
	
	
	
}

package com.beyond.template.vo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.beyond.base.vo.BaseVO;

public class TemplateVO extends BaseVO {
 
	private static final long serialVersionUID = 1L;

	private long TemplateId;
	private int dynamic;
	
	private String name;
	private String content;
    
    private List<ElementVO> elements=new ArrayList<ElementVO>();
    
    private long userId;
    
    private boolean hasElements;
    private boolean hasResponses;
    
    private long sentCount=0l;
    private long responseCount=0l;
    
    private Timestamp lastSentOn;
    
	public long getTemplateId() {
		return TemplateId;
	}
	public void setTemplateId(long templateId) {
		TemplateId = templateId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDynamic() {
		return dynamic;
	}
	public void setDynamic(int dynamic) {
		this.dynamic = dynamic;
	}
    
	public List<ElementVO> getElements() {
		return elements;
	}
	public void setElements(List<ElementVO> elements) {
		this.elements = elements;
	}
	
	 
	public void setElementVO(final int index, ElementVO elementVO){
		this.elements.add(elementVO);
	}
	
	public ElementVO getElementVO(final int index)throws Exception
	{
		if(elements == null)
		{
			elements = new ArrayList<ElementVO>();
		}
		 
		while(index >=elements.size())
		{
			elements.add(new ElementVO());
		}

		return elements.get(index);
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public boolean isHasElements() {
		return hasElements;
	}
	public void setHasElements(boolean hasElements) {
		this.hasElements = hasElements;
	}
	public boolean isHasResponses() {
		return hasResponses;
	}
	public void setHasResponses(boolean hasResponses) {
		this.hasResponses = hasResponses;
	}
	public long getSentCount() {
		return sentCount;
	}
	public void setSentCount(long sentCount) {
		this.sentCount = sentCount;
	}
	public long getResponseCount() {
		return responseCount;
	}
	public void setResponseCount(long responseCount) {
		this.responseCount = responseCount;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + (int) (TemplateId ^ (TemplateId >>> 32));
		result = prime * result + (int) (userId ^ (userId >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		TemplateVO other = (TemplateVO) obj;
		if (TemplateId != other.TemplateId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	public Timestamp getLastSentOn() {
		return lastSentOn;
	}
	public void setLastSentOn(Timestamp lastSentOn) {
		this.lastSentOn = lastSentOn;
	}
	
	

}

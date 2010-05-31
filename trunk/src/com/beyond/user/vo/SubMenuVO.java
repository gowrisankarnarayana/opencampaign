package com.beyond.user.vo;

import com.beyond.base.vo.BaseVO;


public class SubMenuVO  extends BaseVO  implements Comparable<SubMenuVO> {
 
	private static final long serialVersionUID = -6524097956920264007L;
	 
	private long mainMenuId;
	private long subMenuId;
	private String subMenuName;
	private String subMenuLabel;
	private String subMenuLink;
	private String subMenuDesc;
	
	/**
	 * @return the subMenuId
	 */
	public long getSubMenuId() {
		return subMenuId;
	}
	/**
	 * @param subMenuId the subMenuId to set
	 */
	public void setSubMenuId(long subMenuId) {
		this.subMenuId = subMenuId;
	}
	/**
	 * @return the subMenuName
	 */
	public String getSubMenuName() {
		return subMenuName;
	}
	/**
	 * @param subMenuName the subMenuName to set
	 */
	public void setSubMenuName(String subMenuName) {
		this.subMenuName = subMenuName;
	}
	/**
	 * @return the subMenuLabel
	 */
	public String getSubMenuLabel() {
		return subMenuLabel;
	}
	/**
	 * @param subMenuLabel the subMenuLabel to set
	 */
	public void setSubMenuLabel(String subMenuLabel) {
		this.subMenuLabel = subMenuLabel;
	}
	/**
	 * @return the subMenuLink
	 */
	public String getSubMenuLink() {
		return subMenuLink;
	}
	/**
	 * @param subMenuLink the subMenuLink to set
	 */
	public void setSubMenuLink(String subMenuLink) {
		this.subMenuLink = subMenuLink;
	}
	/**
	 * @return the subMenuDesc
	 */
	public String getSubMenuDesc() {
		return subMenuDesc;
	}
	/**
	 * @param subMenuDesc the subMenuDesc to set
	 */
	public void setSubMenuDesc(String subMenuDesc) {
		this.subMenuDesc = subMenuDesc; 
	}
	 
	@Override
	public int compareTo(SubMenuVO o) {
	    Long l=this.subMenuId - o.getSubMenuId();
	    return l.intValue();
	}
	/**
	 * @return the mainMenuId
	 */
	public long getMainMenuId() {
		return mainMenuId;
	}
	/**
	 * @param mainMenuId the mainMenuId to set
	 */
	public void setMainMenuId(long mainMenuId) {
		this.mainMenuId = mainMenuId;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SubMenuVO [mainMenuId=");
		builder.append(mainMenuId);
		builder.append(", subMenuDesc=");
		builder.append(subMenuDesc);
		builder.append(", subMenuId=");
		builder.append(subMenuId);
		builder.append(", subMenuLabel=");
		builder.append(subMenuLabel);
		builder.append(", subMenuLink=");
		builder.append(subMenuLink);
		builder.append(", subMenuName=");
		builder.append(subMenuName);
		builder.append("]");
		return builder.toString();
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + (int) (mainMenuId ^ (mainMenuId >>> 32));
		result = prime * result + (int) (subMenuId ^ (subMenuId >>> 32));
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (!(obj instanceof SubMenuVO))
			return false;
		SubMenuVO other = (SubMenuVO) obj;
		if (mainMenuId != other.mainMenuId)
			return false;
		if (subMenuId != other.subMenuId)
			return false;
		return true;
	}
	
	 
}

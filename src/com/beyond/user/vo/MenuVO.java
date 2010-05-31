package com.beyond.user.vo;

import java.util.ArrayList;
import java.util.List;

import com.beyond.base.vo.BaseVO;

public class MenuVO extends BaseVO implements Comparable<MenuVO>{

 	private static final long serialVersionUID = 4306277704968839548L;

	private long mainMenuId;
	private String mainMenuName;
	private String mainMenuLabel;
	private String mainMenuLink;
	private String mainMenuDesc;
	private String mainMenuImage;
	
	private List<SubMenuVO> listSubMenu=new ArrayList<SubMenuVO>();

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

	/**
	 * @return the mainMenuName
	 */
	public String getMainMenuName() {
		return mainMenuName;
	}

	/**
	 * @param mainMenuName the mainMenuName to set
	 */
	public void setMainMenuName(String mainMenuName) {
		this.mainMenuName = mainMenuName;
	}

	/**
	 * @return the mainMenuLabel
	 */
	public String getMainMenuLabel() {
		return mainMenuLabel;
	}

	/**
	 * @param mainMenuLabel the mainMenuLabel to set
	 */
	public void setMainMenuLabel(String mainMenuLabel) {
		this.mainMenuLabel = mainMenuLabel;
	}

	/**
	 * @return the mainMenuLink
	 */
	public String getMainMenuLink() {
		return mainMenuLink;
	}

	/**
	 * @param mainMenuLink the mainMenuLink to set
	 */
	public void setMainMenuLink(String mainMenuLink) {
		this.mainMenuLink = mainMenuLink;
	}

	/**
	 * @return the mainMenuDesc
	 */
	public String getMainMenuDesc() {
		return mainMenuDesc;
	}

	/**
	 * @param mainMenuDesc the mainMenuDesc to set
	 */
	public void setMainMenuDesc(String mainMenuDesc) {
		this.mainMenuDesc = mainMenuDesc;
	}

	/**
	 * @return the listSubMenu
	 */
	public List<SubMenuVO> getListSubMenu() {
		return listSubMenu;
	}

	/**
	 * @param listSubMenu the listSubMenu to set
	 */
	public void setListSubMenu(List<SubMenuVO> listSubMenu) {
		this.listSubMenu = listSubMenu;
	}

	@Override
	public int compareTo(MenuVO o) {
		Long l=this.mainMenuId - o.getMainMenuId(); 
	    return l.intValue();
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MenuVO [listSubMenu=");
		builder.append(listSubMenu);
		builder.append(", mainMenuDesc=");
		builder.append(mainMenuDesc);
		builder.append(", mainMenuId=");
		builder.append(mainMenuId);
		builder.append(", mainMenuLabel=");
		builder.append(mainMenuLabel);
		builder.append(", mainMenuLink=");
		builder.append(mainMenuLink);
		builder.append(", mainMenuName=");
		builder.append(mainMenuName);
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
		if (!(obj instanceof MenuVO))
			return false;
		MenuVO other = (MenuVO) obj;
		if (mainMenuId != other.mainMenuId)
			return false;
		return true;
	}

	public String getMainMenuImage() {
		return mainMenuImage;
	}

	public void setMainMenuImage(String mainMenuImage) {
		this.mainMenuImage = mainMenuImage;
	}
	
}

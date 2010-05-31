package com.beyond.user.vo;

import java.io.Serializable;
import java.util.List;

import com.beyond.base.vo.BaseVO;

public class GroupVO extends BaseVO implements Serializable{

	private static final long serialVersionUID = 47155913408607014L;

	private long groupId;
	private String groupName;
	private String groupDesc="";
	
	private List<RoleVO> roleVOList=null;
	
	public GroupVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the groupId
	 */
	public long getGroupId() {
		return groupId;
	}

	/**
	 * @param groupId the groupId to set
	 */
	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}

	/**
	 * @return the groupName
	 */
	public String getGroupName() {
		return groupName;
	}

	/**
	 * @param groupName the groupName to set
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	/**
	 * @return the groupDesc
	 */
	public String getGroupDesc() {
		return groupDesc;
	}

	/**
	 * @param groupDesc the groupDesc to set
	 */
	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}

	/**
	 * @return the roleVOList
	 */
	public List<RoleVO> getRoleVOList() {
		return roleVOList;
	}

	/**
	 * @param roleVOList the roleVOList to set
	 */
	public void setRoleVOList(List<RoleVO> roleVOList) {
		this.roleVOList = roleVOList;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GroupVO [groupDesc=");
		builder.append(groupDesc);
		builder.append(", groupId=");
		builder.append(groupId);
		builder.append(", groupName=");
		builder.append(groupName);
		builder.append(", roleVOList=");
		builder.append(roleVOList);
		builder.append("]");
		return builder.toString();
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (groupId ^ (groupId >>> 32));
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof GroupVO))
			return false;
		GroupVO other = (GroupVO) obj;
		if (groupId != other.groupId)
			return false;
		return true;
	}

	
}

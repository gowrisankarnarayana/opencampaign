/**
 * 
 */
package com.beyond.user.vo;

import java.io.Serializable;
import java.util.List;

import com.beyond.base.vo.BaseVO;

/**
 * @author Narayana
 *
 */ 
public class RoleVO  extends BaseVO  implements Serializable{

	private long roleId;
	private String roleName;
	private String roleDesc;
	
	List<TaskVO> taskVOList=null;
	
	private static final long serialVersionUID = 1L;

	public RoleVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the roleId
	 */
	public long getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * @return the roleDesc
	 */
	public String getRoleDesc() {
		return roleDesc;
	}

	/**
	 * @param roleDesc the roleDesc to set
	 */
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	/**
	 * @return the taskVOList
	 */
	public List<TaskVO> getTaskVOList() {
		return taskVOList;
	}

	/**
	 * @param taskVOList the taskVOList to set
	 */
	public void setTaskVOList(List<TaskVO> taskVOList) {
		this.taskVOList = taskVOList;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RoleVO [roleDesc=");
		builder.append(roleDesc);
		builder.append(", roleId=");
		builder.append(roleId);
		builder.append(", roleName=");
		builder.append(roleName);
		builder.append(", taskVOList=");
		builder.append(taskVOList);
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
		result = prime * result + (int) (roleId ^ (roleId >>> 32));
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
		if (!(obj instanceof RoleVO))
			return false;
		RoleVO other = (RoleVO) obj;
		if (roleId != other.roleId)
			return false;
		return true;
	}

}

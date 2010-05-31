/**
 * 
 */
package com.beyond.user.vo;

import java.io.Serializable;

import com.beyond.base.vo.BaseVO;

/**
 * @author Narayana
 *
 */
public class TaskVO extends BaseVO implements Serializable {

 
	private static final long serialVersionUID = 1L;
	private long taskId; 
	private String taskName;
	private String taskDesc;
		 
	public TaskVO() {
		 
	}
	public TaskVO(long taskId, String taskName, String taskDesc) {
		
		this.taskDesc=taskDesc;
		this.taskId=taskId;
		this.taskName=taskName;
	}
	/**
	 * @return the taskId
	 */
	public long getTaskId() {
		return taskId;
	}

	/**
	 * @param taskId the taskId to set
	 */
	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	/**
	 * @return the taskName
	 */
	public String getTaskName() {
		return taskName;
	}

	/**
	 * @param taskName the taskName to set
	 */
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	/**
	 * @return the taskDesc
	 */
	public String getTaskDesc() {
		return taskDesc;
	}

	/**
	 * @param taskDesc the taskDesc to set
	 */
	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TaskVO [taskDesc=");
		builder.append(taskDesc);
		builder.append(", taskId=");
		builder.append(taskId);
		builder.append(", taskName=");
		builder.append(taskName);
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
		result = prime * result + (int) (taskId ^ (taskId >>> 32));
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
		if (!(obj instanceof TaskVO))
			return false;
		TaskVO other = (TaskVO) obj;
		if (taskId != other.taskId)
			return false;
		return true;
	}

	
}

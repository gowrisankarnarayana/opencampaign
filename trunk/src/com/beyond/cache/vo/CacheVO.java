package com.beyond.cache.vo;

import java.io.Serializable;
import java.util.Date;

public class CacheVO implements Serializable {
 
	private static final long serialVersionUID = 1L;

	private Long 	cacheId;
	private String  cacheName;
	private Date 	lastInitDate;
	private int 	statusId;
	private String  status;
	private long 	size;
	private long memoryUsed; 
	
	public long getMemoryUsed() {
		return memoryUsed;
	}
	public void setMemoryUsed(long memoryUsed) {
		this.memoryUsed = memoryUsed;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getCacheId() {
		return cacheId;
	}
	public void setCacheId(Long cacheId) {
		this.cacheId = cacheId;
	}
	public String getCacheName() {
		return cacheName;
	}
	public void setCacheName(String cacheName) {
		this.cacheName = cacheName;
	}
	public Date getLastInitDate() {
		return lastInitDate;
	}
	public void setLastInitDate(Date lastInitDate) {
		this.lastInitDate = lastInitDate;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	
	
	
}

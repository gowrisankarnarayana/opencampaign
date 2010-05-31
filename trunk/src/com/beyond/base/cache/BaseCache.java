package com.beyond.base.cache;

import java.util.Date;

public abstract class BaseCache {
	
	public abstract void initialize();
	public abstract void refresh();
	public abstract void refreshCache(Long id);
	public abstract String getStatus();
	public abstract long getSize();
	public abstract String getName();
	public abstract Date getLastRefreshed();
 	 
	
}

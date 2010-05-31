package com.beyond.dwr.action;

import com.beyond.cache.CacheManager;


public class CacheAction {

	 public String initCache(String cacheName){
		 return CacheManager.initializeCache(cacheName);
	 }
	
	
}

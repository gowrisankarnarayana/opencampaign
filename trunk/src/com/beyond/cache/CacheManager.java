package com.beyond.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beyond.base.cache.BaseCache;
import com.beyond.cache.vo.CacheVO;
import com.beyond.customer.cache.ContactCache;
import com.beyond.list.cache.ListCache;
import com.beyond.mail.cache.MailCache;
import com.beyond.template.cache.TemplateCache;
import com.beyond.user.cache.UserCache;
import com.beyond.util.Logger;

public class CacheManager {
 
	private static final long serialVersionUID = -6030162005503677075L;
	
	private static Map<String,BaseCache> cacheMap=new HashMap<String,BaseCache>(0);
	
	static{
		Logger.info("Initializing Cache Manager");
		registerCache(new ContactCache());
		registerCache(new ListCache());
		registerCache(new UserCache());
		registerCache(new TemplateCache());
		registerCache(new MailCache());
	}
	
	public static void registerCache(BaseCache cache){
		cacheMap.put(cache.getName(), cache);
	} 
	
	public static void refreshCache(String cacheName){
		BaseCache cache = cacheMap.get(cacheName);
		cache.refresh();
	}
	
	public static String initializeCache(final String cacheName){
		
		final BaseCache cache = cacheMap.get(cacheName);
		
		new Thread(){
			public void run(){
				try{
					Logger.info("Initializing Cache :" + cacheName);
					cache.initialize();
					}catch(Exception e){
							e.printStackTrace();
							Logger.error(e.toString());
						}
					}
			}.start();
			
		return   cacheName + " Initialization In Progress";
	}
	
	public static Map<String,BaseCache> getCacheMap(){
		return cacheMap;
	}
	
	public static List<CacheVO> getCacheStatistics(){
		
		List<CacheVO> cache= new ArrayList<CacheVO>(0);
		
		for(BaseCache c:cacheMap.values()){
			CacheVO vo=new CacheVO();
			vo.setCacheName(c.getName());
			vo.setStatus(c.getStatus());
			vo.setSize(c.getSize());
			vo.setLastInitDate(c.getLastRefreshed()); 
			cache.add(vo);
		}
		
		return cache;
		
	}
	
}

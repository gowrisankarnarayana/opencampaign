package com.beyond.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.beyond.constants.HtmlConstants;

public class BeyondError implements Serializable {
 
	private static final long serialVersionUID = 2836587044328903131L;

	private List<String> errors =new ArrayList<String>(0);
	private List<String> messages =new ArrayList<String>(0);
	
	public void add(String s){
		errors.add(s);
	}
	public void addError(String s){
		errors.add(s);
	}
	
	public void addMessage(String s){
		messages.add(s);
	}
	public String toSimpleString(){
		StringBuilder sb=new StringBuilder();
		for(String e:errors){
			sb.append(e);	
		}
	   return sb.toString();
	}
	public String toString(){
		StringBuilder sb=new StringBuilder();
		sb.append(HtmlConstants.TAG_OL_START);
		for(String e:errors){
			sb.append(HtmlConstants.TAG_LI_START).append(e).append(HtmlConstants.TAG_LI_END);	
		}
		sb.append(HtmlConstants.TAG_OL_END);
		return sb.toString();
	}  
	 
	public String getHtmlMessage(){
		StringBuilder sb=new StringBuilder();
		sb.append(HtmlConstants.TAG_UL_START);
		for(String e:messages){
			sb.append(HtmlConstants.TAG_LI_START).append(e).append(HtmlConstants.TAG_LI_END);	
		}
		sb.append(HtmlConstants.TAG_UL_END);
		return sb.toString();
	}	
	
	public boolean hasErrors(){
		return errors.size()>0;
	}
	public boolean hasMessages(){
		return messages.size()>0;
	}
	public int count(){
		return errors.size();
	}
	public int errorCount(){
		return errors.size();
	}
	public int messageCount(){
		return messages.size();
	}
}

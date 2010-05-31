package com.beyond.base.vo;

import java.io.Serializable;

import com.beyond.util.Logger;

public class ActionVO implements Serializable {

	private static final long serialVersionUID = 2126846731985028027L;

	private String mnu; // Main Menu Name
	private String sub; // Sub Menu Name
	private String nxt;
	  
	private boolean actionFailed;
	private boolean showMessage; 
	private String  actionMessage=""; 
	
//	public static void main(String a[]) throws Exception{
//		String route="customers/uploadCustomers/bulkUpload";
//		for(String s:route.split("/")){
//		System.out.println(s);
//		}
//	}
	
	public ActionVO(String route) throws Exception{
		 String arr[]=route.split("/");
		 mnu=arr[0];
		 sub=arr[1];
		 nxt=arr[2];
		 Logger.info("Forward Name : " + nxt);
	}
	public ActionVO(String mnu, String sub, String message){
		this.mnu=mnu;
		this.sub=sub;
		this.actionMessage=message;
		actionFailed=false;		 
	}

	public ActionVO(String mnu, String sub, String message, boolean actionFailed){
		this.mnu=mnu;
		this.sub=sub;
		this.actionMessage=message;
		this.actionFailed=actionFailed;		 
	}
	 

	public boolean isActionFailed() {
		return actionFailed;
	}

	public void setActionFailed(boolean actionFailed) {
		this.actionFailed = actionFailed;
	}

	public boolean isShowMessage() {
		return showMessage;
	}

	public void setShowMessage(boolean showMessage) {
		this.showMessage = showMessage;
	}

	public String getActionMessage() {
		StringBuilder sbf=new StringBuilder();
	
		if(!actionFailed){
		sbf.append("<b><font color='green'>").append(this.actionMessage);
		sbf.append("</font></b>");
		}else{
		sbf.append("<b><font color='red'>").append(this.actionMessage);
		sbf.append("</font></b>");	
		}
		
		return sbf.toString();
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}



	public String getMnu() {
		return mnu;
	}



	public void setMnu(String mnu) {
		this.mnu = mnu;
	}



	public String getSub() {
		return sub;
	}



	public void setSub(String sub) {
		this.sub = sub;
	}
	
	public String getNxt() {
		return nxt;
	}
	
	public void setNxt(String nxt) {
		this.nxt = nxt;
	}
	 
 
}

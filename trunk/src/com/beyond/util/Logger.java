package com.beyond.util;

public   class Logger {

	public static void debug(String str){
		
		System.out.println("Logger.Debug :> "+str);
	}
	
	public static void error(String str){
		
		System.out.println("Logger.Error :> "+str);
	}
	
	public static void info(String str){
		
		System.out.println("Logger.Info : > "+str);
	}
	
	public static void warning(String str){
		
		System.out.println("Logger.Warning :> "+str);
	}
	
	public static void fatal(String str){
		
		System.out.println("Logger.Fatal :> "+str);
	}

	 
	
}
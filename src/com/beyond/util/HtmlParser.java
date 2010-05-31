package com.beyond.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.htmlparser.jericho.FormControl;
import net.htmlparser.jericho.Source;

import com.beyond.template.vo.ElementVO;

public class HtmlParser {

//	public static void main(String a[]) throws Exception{
//		Set<String> elementNames =new HashSet<String>();
//		InputStream is =new FileInputStream("D:/feed.html");
//		Source source= new Source(is);
// 		List<FormControl> formCtrls = source.getFormControls();
//		for(FormControl f:formCtrls){
//		    Map<String,String> attMap = f.getAttributesMap();
//		    for (Object element : attMap.entrySet()) {
//		    	   Map.Entry<String,String> entry = (Map.Entry<String,String>) element;
//		    	   String key = entry.getKey();
//		    	   String value = entry.getValue();
//		    	   if(key.equalsIgnoreCase("name")){
//		    		   elementNames.add(value);
//		    	   }
//		    	   //System.out.println("Key : " + key + " Value :" + value);
//		   }System.out.println(elementNames.toString());
//		}
//	}
	
	public List<ElementVO> getFormElements(String htmlSource)throws Exception{
		
		Logger.info("Entering HtmlParser.getFormElements()");
		
		List<ElementVO> elements=new ArrayList<ElementVO>(0);
		
		InputStream is = new ByteArrayInputStream(htmlSource.getBytes()); 
		Source source  = new Source(is);
	    		int i=1;
 				for(String n:getElementNames(source)){
 					ElementVO vo=new ElementVO();
 					vo.setElementName(n);
 					vo.setElementOrder(i);
 					elements.add(vo);
 					i++;
 				}
 		
 		Logger.info("Elements Count :" + elements.size());		
		
 		return elements;
		
	}
	
	@SuppressWarnings("unchecked")
	
	private Set<String> getElementNames(Source source) throws Exception{
		Logger.info("Entering HtmlParser.getElementNames()");
		
		Set<String> elementNames= new HashSet<String>();
		
		List<FormControl> formCtrls = source.getFormControls();
	    
		for(FormControl f:formCtrls){
		    Map<String,String> attMap = f.getAttributesMap();
		    
		    for (Object element : attMap.entrySet()) {
		    	   
		    	   Map.Entry<String,String> entry = (Map.Entry<String,String>) element;
		    	   String key = entry.getKey();
		    	   String value = entry.getValue();
		    	   
		    	   if(key.equalsIgnoreCase("name")){
		    		   elementNames.add(value);
		    	   }
		    	      
		     }
		    
		}
		Logger.info("Leaving HtmlParser.getElementNames() " + elementNames.toString());
		return elementNames;
	}
	
	
}

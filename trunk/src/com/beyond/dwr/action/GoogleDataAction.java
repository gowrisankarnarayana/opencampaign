package com.beyond.dwr.action;

import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.beyond.constants.ApplicationConstants;
import com.beyond.user.vo.UserVO;
import com.beyond.util.HttpUtil;
import com.beyond.util.Logger;
import com.google.visualization.datasource.DataSourceServlet;
import com.google.visualization.datasource.base.DataSourceException;
import com.google.visualization.datasource.base.ReasonType;
import com.google.visualization.datasource.datatable.ColumnDescription;
import com.google.visualization.datasource.datatable.DataTable;
import com.google.visualization.datasource.datatable.value.ValueType;
import com.google.visualization.datasource.query.Query;

public class GoogleDataAction extends DataSourceServlet {
 
	private static final long serialVersionUID = -6633214704169184874L;
	private UserVO user=null; 
	
	@Override
	public DataTable generateDataTable(Query qury, HttpServletRequest req)
			throws DataSourceException{

		DataTable data = new DataTable();
		try{  
		  Logger.info("Begin GoogleDataAction.generateDataTable");  
		  verifyUser(req);
		     
		  ArrayList<ColumnDescription> cd = new ArrayList<ColumnDescription>();
		  cd.add(new ColumnDescription("Template", 	ValueType.TEXT,   "Template Name"));
		  cd.add(new ColumnDescription("Year", 	ValueType.NUMBER, "Year"));
		  cd.add(new ColumnDescription("Sent", 	 	ValueType.NUMBER, "Sent"));
		  cd.add(new ColumnDescription("Opened", 	ValueType.NUMBER, "Opened"));
		  cd.add(new ColumnDescription("Clickthru", ValueType.NUMBER, "Click Through")); 
		  data.addColumns(cd);
		   
		  Logger.info("Begin GoogleDataAction.generateDataTable AddingRowFromValues");
	      data.addRowFromValues("NewsLetterFirst",  2010, 3000, 2500,2000);
	      data.addRowFromValues("NewsLetterSecond", 2010, 5000, 2344,1245);
	      data.addRowFromValues("NewsLetterThird",  2010, 2345, 1234,1212);
	      data.addRowFromValues("NewsLetterFourth", 2010, 5637, 4546,2222);
	      data.addRowFromValues("NewsLetterFiifth", 2010, 2356, 2120,1989); 
	          
	    } catch (DataSourceException e) {
	    	throw e;
	    } catch (Exception e){
	    	e.printStackTrace();
	    }
	    
	    return data; 
	}
	@Override
	protected boolean isRestrictedAccessMode() {
	    return false;
	}
	public boolean verifyUser(HttpServletRequest req) throws DataSourceException{
		
		try{ 
		Logger.info("Begin GoogleDataAction Validating User "); 
		HttpSession sess=req.getSession();
			if(HttpUtil.hasAttribute(sess, ApplicationConstants.SESSION_USER_OBJECT)){
				Logger.info("Session seems to have a valid user");
				user=(UserVO)sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
				return true;
			}else{
				throw new DataSourceException( ReasonType.ACCESS_DENIED,"Invalid User");
			}
		}catch(Exception e){
			Logger.error(e.toString());
		}
		
		return false;
	}

}

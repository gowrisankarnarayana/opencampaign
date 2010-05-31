package com.beyond.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;

import com.beyond.constants.ValidationConstants;
import com.beyond.customer.vo.CustomerFileUploadVO;
import com.beyond.customer.vo.CustomerVO;

public class ExcelReader {
 
//		public static void main(String[] args) throws Exception {
//	 		InputStream is = new FileInputStream(new File("D:/Feedback_Customers.xls"));
//			getCustomersFromExcel(is);
//		}

		  public List<CustomerVO> getCustomersFromExcel(CustomerFileUploadVO cFile,BeyondError errors) throws Exception
		  {
			Logger.info("Entering ExcelProcessor.getCustomersFromExcel");
			
			List<CustomerVO> customers= new ArrayList<CustomerVO>(0);
				
			WorkbookSettings ws = new WorkbookSettings();
		    ws.setLocale(new Locale("en", "EN"));

		    Workbook workbook = Workbook.getWorkbook(cFile.getTheFile().getInputStream(),ws);

		    Logger.info("ExcelProcessor.getCustomersFromExcelObtaining first worksheet");
		    
		    Sheet sheet  = workbook.getSheet(0);
		    Logger.info("ExcelProcessor.getCustomersFromExcelReading data");  
			
		    for (int rowNum=1;rowNum<sheet.getRows();rowNum++) {
				
				CustomerVO vo=new CustomerVO();
				
			 	//Title	FirstName	LastName	Email	Mobile	LandPhone	ContactDetails
				Cell title = sheet.getCell(0,rowNum);
				Cell firstName= sheet.getCell(1,rowNum);
				Cell lastName = sheet.getCell(2,rowNum);
				Cell email = sheet.getCell(3,rowNum);
				Cell landPhone = sheet.getCell(4,rowNum);
				Cell mobile = sheet.getCell(5,rowNum);
				Cell contactDetails = sheet.getCell(6,rowNum);
				
				String em=email.getContents(); 
				
				Logger.info("Validating RowNum "+ rowNum + em );
				
				if(em==null || em.trim().equalsIgnoreCase("")){
					errors.add("Row Number : "+ rowNum + ". Email must not be empty.");
				}else{
					if(!isEmailValid(em)){
						errors.add("Row Number : "+ rowNum + ". Email is invalid.");	
					}else{
						vo.setTitle(title.getContents());
						vo.setFirstName(firstName.getContents());
						vo.setLastName(lastName.getContents());
						vo.setEmail(email.getContents());
						vo.setLandPhone(landPhone.getContents());
						vo.setMobile(mobile.getContents());
						vo.setContactDetails(contactDetails.getContents()); 
						vo.setSubscriptionStatus(cFile.getSubscriptionStatus());
						vo.setGroupId(cFile.getGroupId());
						Logger.info(vo.toString()); 
						customers.add(vo);
					}
				} 
			}
			Logger.info("Leaving ExcelProcessor.getCustomersFromExcel");
			return customers;
			}

		  

		  public static boolean isEmailValid(String email){
		  boolean isValid = false; 
		 	  CharSequence inputStr = email;
			  Pattern pattern = Pattern.compile(ValidationConstants.REGEX_EMAIL,Pattern.CASE_INSENSITIVE);
			  Matcher matcher = pattern.matcher(inputStr);
			  if(matcher.matches()){
			  isValid = true;
			  }
		  return isValid;
		  }
		   
	}

package com.beyond.util;

import java.io.ByteArrayOutputStream;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.beyond.base.vo.FileVO;
import com.beyond.customer.vo.CustomerVO;

public class ExcelWriter {

	public static synchronized FileVO getContactsExcel(List<CustomerVO> contacts) throws Exception{
		
		FileVO vo=new FileVO();
		
		Logger.info("Entering ExcelWriter.getContactsExcel()");
		
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		WritableWorkbook workbook = Workbook.createWorkbook(os);
		WritableSheet sheet = workbook.createSheet("Contacts List", 0);
		
		Label lblId = new Label(0,0, "Id");
		Label lblFirstName = new Label(1,0, "FirstName");
		Label lblLastName = new Label(2,0, "LastName");
		Label lblEmail = new Label(3,0, "Email");
		Label lblMobile = new Label(4,0, "Mobile");
		Label lblContact = new Label(5,0, "Contact Details");
		
		sheet.addCell(lblId);
		sheet.addCell(lblFirstName);
		sheet.addCell(lblLastName);
		sheet.addCell(lblEmail);
		sheet.addCell(lblMobile);
		sheet.addCell(lblContact);		
		
		int rowNum=1;
		
		Logger.info("Looping through contacts");
		
		for(CustomerVO cvo:contacts){
			
		 	sheet.addCell(new Label(0, rowNum, cvo.getCustomerId()+ ""));
			sheet.addCell(new Label(1, rowNum, cvo.getFirstName()));
			sheet.addCell(new Label(2, rowNum, cvo.getLastName()));
			sheet.addCell(new Label(3, rowNum, cvo.getEmail()));
			sheet.addCell(new Label(4, rowNum, cvo.getMobile()));
			sheet.addCell(new Label(5, rowNum, cvo.getContactDetails()));
			
			rowNum+=1;
		}
		
		workbook.write();
		workbook.close();
		
		vo.setByteArray(os.toByteArray());
		vo.setFileSize(os.size());
		vo.setFileName("Contacts.xls");
		vo.setFileExtn("xls");
		vo.setFileContentType("application/vnd.ms-excel");
		Logger.info("Leaving ExcelWriter.getContactsExcel()");
		
		return vo;
	}
	
}

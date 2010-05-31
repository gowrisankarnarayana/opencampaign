package com.beyond.util;

import java.io.ByteArrayOutputStream;
import java.util.List;

import com.beyond.base.vo.FileVO;
import com.beyond.customer.vo.CustomerVO;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
 
public class PDFWriter {
 
	public static synchronized FileVO getContactsPDF(List<CustomerVO> contacts) throws Exception{
		
		Logger.info("Entering into PDFWriter.getContactsPDF()");
		
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		FileVO fvo =new FileVO();
		Document doc=new Document(PageSize.A4);
		PdfWriter writer= PdfWriter.getInstance(doc,bos);
		PdfPTable table= new PdfPTable(6);
		
		Font font = new Font(Font.TIMES_ROMAN, 9);
	 	float[] widths = new float[] { 2f, 4f,4f,8f,4f,10f};
	 	
	 	
 		doc.addTitle("Contacts");
		doc.open();
		
		table.setWidths(widths);
	 	table.setHorizontalAlignment(0);
	 	
		PdfPCell cell = new PdfPCell(new Paragraph("List of contacts"));
	    cell.setColspan(6);
	    table.addCell(cell);
	      
		table.addCell( new Phrase("Sno",	font));
		table.addCell( new Phrase("First Name",	font));
		table.addCell( new Phrase("Last Name",	font));
		table.addCell( new Phrase("Email",	font));
		table.addCell( new Phrase("Mobile",	font));
		table.addCell( new Phrase("Contact Details", font));
		
		Logger.info("Looping through contacts");
		int cnt=1;
		for(CustomerVO cvo:contacts){
		
			table.addCell(new Phrase(String.valueOf(cnt++), font));
			table.addCell(new Phrase(cvo.getFirstName(), font));   
			table.addCell(new Phrase(cvo.getLastName(), font));    
			table.addCell(new Phrase(cvo.getEmail(), font));       
			table.addCell(new Phrase(cvo.getMobile(), font));      
			table.addCell(new Phrase(cvo.getContactDetails(), font));
		
		}
		
		doc.add(table);
		
		doc.close();
		writer.close();
		
		fvo.setByteArray(bos.toByteArray());
		fvo.setFileContentType("application/pdf");
		fvo.setFileName("Contacts.pdf");
		fvo.setFileSize(bos.size());
		
		Logger.info("Leaving from PDFWriter.getContactsPDF");
		
		return fvo;
	}	
	
}

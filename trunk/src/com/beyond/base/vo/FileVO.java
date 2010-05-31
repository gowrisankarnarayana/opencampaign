package com.beyond.base.vo;

public class FileVO extends BaseVO {
	
 	private static final long serialVersionUID = 1L;
 	
	private long fileId;	
	private String fileName;
	private String fileLogicalName;
	private String fileDesc;
	private String fileExtn;
	private String fileContentType;
	private byte[] byteArray;
	private int fileSize;
	
	public long getFileId() {
		return fileId;
	}
	public void setFileId(long fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileLogicalName() {
		return fileLogicalName;
	}
	public void setFileLogicalName(String fileLogicalName) {
		this.fileLogicalName = fileLogicalName;
	}
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public String getFileExtn() {
		return fileExtn;
	}
	public void setFileExtn(String fileExtn) {
		this.fileExtn = fileExtn;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public byte[] getByteArray() {
		return byteArray;
	}
	public void setByteArray(byte[] byteArray) {
		this.byteArray = byteArray;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
	
	
}

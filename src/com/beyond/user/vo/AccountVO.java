package com.beyond.user.vo;

import java.io.Serializable;

import com.beyond.base.vo.BaseVO;
import com.beyond.master.vo.Address;

public class AccountVO extends BaseVO implements Serializable {
 
	private static final long serialVersionUID = -1141860799028663755L;
	
	private String companyName="";
	private String companyNumber="";
	private String companyPhone="";
	private String companyAddress="";
	 
	private Address address=new Address();

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyNumber() {
		return companyNumber;
	}

	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	
	
}

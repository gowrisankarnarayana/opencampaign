package com.beyond.user.vo;

import java.util.ArrayList;
import java.util.List;

import com.beyond.base.vo.BaseVO;
 
public class UserVO extends BaseVO {

	private static final long serialVersionUID = 1L;
	
	private long id;  
	private String title;
	private String firstName;
	private String lastName;
	private String userName;
	
	private String email;
	private String mobile;
	private String landPhone;
	
	private String userPassword;
	
	private AccountVO accountVO=new AccountVO();
	
	private List<GroupVO> listGroupVO=new ArrayList<GroupVO>();
	private List<MenuVO> listMenuVO=new ArrayList<MenuVO>();
	
	private int userTypeId;  
	private int userGroupId;
	
	private boolean confirmed;
	private boolean configuration;
	private boolean customers;
	private boolean templates;
	private boolean mailers;
	private boolean validUser;
	
	private String encryptedId;
	private String encryptedAPICode;
	
	public UserVO(){
		
	}
	public UserVO(long userId){
		this.id=userId;
	}
	
	public boolean isValidUser() {
		return validUser;
	}
	public void setValidUser(boolean validUser) {
		this.validUser = validUser;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUserName() {
		if(this.userName==null || this.userName==""){
			return this.firstName + " " + this.lastName;
		}else{
			return this.userName;
		}
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public boolean isConfirmed() {
		return confirmed;
	}
	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}
	public int getUserGroupId() {
		return userGroupId;
	}
	public void setUserGroupId(int userGroupId) {
		this.userGroupId = userGroupId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public boolean isConfiguration() {
		return configuration;
	}
	public void setConfiguration(boolean configuration) {
		this.configuration = configuration;
	}
	public boolean isCustomers() {
		return customers;
	}
	public void setCustomers(boolean customers) {
		this.customers = customers;
	}
	public boolean isTemplates() {
		return templates;
	}
	public void setTemplates(boolean templates) {
		this.templates = templates;
	}
	public boolean isMailers() {
		return mailers;
	}
	public void setMailers(boolean mailers) {
		this.mailers = mailers;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public AccountVO getAccountVO() {
		return accountVO;
	}
	public void setAccountVO(AccountVO accountVO) {
		this.accountVO = accountVO;
	}
	public List<GroupVO> getListGroupVO() {
		return listGroupVO;
	}
	public void setListGroupVO(List<GroupVO> listGroupVO) {
		this.listGroupVO = listGroupVO;
	}
	public List<MenuVO> getListMenuVO() {
		return listMenuVO;
	}
	public void setListMenuVO(List<MenuVO> listMenuVO) {
		this.listMenuVO = listMenuVO;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getLandPhone() {
		return landPhone;
	}
	public void setLandPhone(String landPhone) {
		this.landPhone = landPhone;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserVO [accountVO=");
		builder.append(accountVO);
		builder.append(", configuration=");
		builder.append(configuration);
		builder.append(", confirmed=");
		builder.append(confirmed);
		builder.append(", customers=");
		builder.append(customers);
		builder.append(", email=");
		builder.append(email);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", id=");
		builder.append(id);
		builder.append(", landPhone=");
		builder.append(landPhone);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", listGroupVO=");
		builder.append(listGroupVO);
		builder.append(", listMenuVO=");
		builder.append(listMenuVO);
		builder.append(", mailers=");
		builder.append(mailers);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", templates=");
		builder.append(templates);
		builder.append(", title=");
		builder.append(title);
		builder.append(", userGroupId=");
		builder.append(userGroupId);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", userPassword=");
		builder.append(userPassword);
		builder.append(", userTypeId=");
		builder.append(userTypeId);
		builder.append(", validUser=");
		builder.append(validUser);
		builder.append("]");
		return builder.toString();
	}
	public String getEncryptedId() {
		this.encryptedId=this.id+"";
		return com.beyond.util.SecurityUtil.encoder.encode(encryptedId.getBytes());
	}
	public void setEncryptedId(String encryptedId) {
		this.encryptedId = encryptedId;
	}
	public String getEncryptedAPICode() {
		this.encryptedAPICode = this.id+"";
		return com.beyond.util.SecurityUtil.encoder.encode(encryptedAPICode.getBytes());
	}
	public void setEncryptedAPICode(String encryptedAPICode) {
		this.encryptedAPICode =  encryptedAPICode;
	}
	 
	 
	
	

}

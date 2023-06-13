/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities;

import java.sql.Date;

/**
 *
 * @author Deepanshu
 */
public class User {
private String previousUserName;
private Integer Id;
	private String Email;
	private String FirstName;
	private String LastName;
	private String address;
	private String PhoneNumber;
	private String UserName;
	private String ProfilePic;
	private boolean visible;
	private String Role;
	private String Domain;
	private String Password;
	private boolean enabled;
	private String workDetail;

	public String getWorkDetail() {
		return workDetail;
	}

	public void setWorkDetail(String workDetail) {
		this.workDetail = workDetail;
	}
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	

	public String getPreviousUserName() {
		return previousUserName;
	}

	public void setPreviousUserName(String previousUserName) {
		this.previousUserName = previousUserName;
	}
	//UPDATE CONSTRUCTOR
public User(String first_name, String last_name, String e_mail, String u_id, Date dateOfBirth, String domain, String about,String perviousUserName) {
	this.Email = e_mail;
		this.FirstName = first_name;
		this.LastName = last_name;
		this.UserName = u_id;
		this.Domain = domain;
		this.About = about;
		this.dateOfBirth = dateOfBirth;
		this.previousUserName = perviousUserName;
		
	}
//INSERT CONSTRUCTOR
	public User( String FirstName, String LastName,String Email, String UserName, String Password,Date dateOfBirth, String About ,String role ) {
		this.Email = Email;
		this.FirstName = FirstName;
		this.LastName = LastName;
		this.UserName = UserName;
	this.Role = role;	
		this.Password = Password;
		this.About = About;
		
		this.dateOfBirth = dateOfBirth;
	}

	public User() {
		
	}

	public String getDomain() {
		return Domain;
	}

	public void setDomain(String Domain) {
		this.Domain = Domain;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	private String Gender;
	private String About;
	private Date dateOfBirth;

	public String getAbout() {
		return About;
	}

	public void setAbout(String About) {
		this.About = About;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String Gender) {
		this.Gender = Gender;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer Id) {
		this.Id = Id;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String Email) {
		this.Email = Email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String Password) {
		this.Password = Password;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String FirstName) {
		this.FirstName = FirstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String LastName) {
		this.LastName = LastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String PhoneNumber) {
		this.PhoneNumber = PhoneNumber;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String UserName) {
		this.UserName = UserName;
	}

	public String getProfilePic() {
		return ProfilePic;
	}

	public void setProfilePic(String ProfilePic) {
		this.ProfilePic = ProfilePic;
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String Role) {
		this.Role = Role;
	}

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities;
public class Supervisor {
	private String SUP_ID;
	private String FirstName;
	private String LastName;
	private String Designation;
	private String Contact;
	private String Affilication;
	private boolean Active;

	public boolean isActive() {
		return Active;
	}

	public void setActive(boolean Active) {
		this.Active = Active;
	}
	public String getSUP_ID() {
		return SUP_ID;
	}

	public void setSUP_ID(String SUP_ID) {
		this.SUP_ID = SUP_ID;
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

	public String getDesignation() {
		return Designation;
	}

	public void setDesignation(String Designation) {
		this.Designation = Designation;
	}

	public String getContact() {
		return Contact;
	}

	public void setContact(String Contact) {
		this.Contact = Contact;
	}

	public String getAffilication() {
		return Affilication;
	}

	public void setAffilication(String Affilication) {
		this.Affilication = Affilication;
	}
}

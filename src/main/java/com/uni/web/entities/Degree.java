/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities;
public class Degree {
	private int DegreeId;
	private String DegreeName;
	private String Designation;
	private boolean active;
	public int getDegreeId() {
		return DegreeId;
	}

	public void setDegreeId(int DegreeId) {
		this.DegreeId = DegreeId;
	}

	public String getDegreeName() {
		return DegreeName;
	}

	public void setDegreeName(String DegreeName) {
		this.DegreeName = DegreeName;
	}

	public String getDesignation() {
		return Designation;
	}

	public void setDesignation(String Designation) {
		this.Designation = Designation;
	}

	public void setActive(boolean b) {
		this.active =  b; 
		
	}
	public boolean getActive()
	{
		return this.active;
	}
}

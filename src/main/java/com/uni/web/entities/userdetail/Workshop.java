/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities.userdetail;

import java.sql.Date;

/**
 *
 * @author Deepanshu
 */
public class Workshop {
private String WorkshopAlias;
private String WorkshopName;
private Date WorkshopDate;
private String WorkshopLocation;
private String WorkshopTopic;
private String WorkshopOrganiser;
private String WorkshopSchedule;
private String WorkshopMaterial;

	public String getWorkshopMaterial() {
		return WorkshopMaterial;
	}

	public void setWorkshopMaterial(String WorkshopMaterial) {
		this.WorkshopMaterial = WorkshopMaterial;
	}
private String WorkshopWebsite;
private String WorkshopUID;

	public String getWorkshopUID() {
		return WorkshopUID;
	}

	public void setWorkshopUID(String WorkshopUID) {
		this.WorkshopUID = WorkshopUID;
	}
	public String getWorkshopAlias() {
		return WorkshopAlias;
	}

	public void setWorkshopAlias(String WorkshopAlias) {
		this.WorkshopAlias = WorkshopAlias;
	}

	public String getWorkshopName() {
		return WorkshopName;
	}

	public void setWorkshopName(String WorkshopName) {
		this.WorkshopName = WorkshopName;
	}

	public Date getWorkshopDate() {
		return WorkshopDate;
	}

	public void setWorkshopDate(Date WorkshopDate) {
		this.WorkshopDate = WorkshopDate;
	}

	public String getWorkshopLocation() {
		return WorkshopLocation;
	}

	public void setWorkshopLocation(String WorkshopLocation) {
		this.WorkshopLocation = WorkshopLocation;
	}

	public String getWorkshopTopic() {
		return WorkshopTopic;
	}

	public void setWorkshopTopic(String WorkshopTopic) {
		this.WorkshopTopic = WorkshopTopic;
	}

	public String getWorkshopOrganiser() {
		return WorkshopOrganiser;
	}

	public void setWorkshopOrganiser(String WorkshopOrganiser) {
		this.WorkshopOrganiser = WorkshopOrganiser;
	}

	public String getWorkshopSchedule() {
		return WorkshopSchedule;
	}

	public void setWorkshopSchedule(String WorkshopSchedule) {
		this.WorkshopSchedule = WorkshopSchedule;
	}

	

	public String getWorkshopWebsite() {
		return WorkshopWebsite;
	}

	public void setWorkshopWebsite(String WorkshopWebsite) {
		this.WorkshopWebsite = WorkshopWebsite;
	}

}

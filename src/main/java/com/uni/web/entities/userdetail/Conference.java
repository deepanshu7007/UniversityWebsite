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
public class Conference {

	private String ConferenceAlias;
	private Date ConferenceDate;
	private String ConferenceUID;
	private String ConferenceMode;

	public String getConferenceUID() {
		return ConferenceUID;
	}

	public void setConferenceUID(String ConferenceUID) {
		this.ConferenceUID = ConferenceUID;
	}

	public String getConferenceMode() {
		return ConferenceMode;
	}

	public void setConferenceMode(String ConferenceMode) {
		this.ConferenceMode = ConferenceMode;
	}

	

	
	public Date getConferenceDate() {
		return ConferenceDate;
	}

	public String getConferenceAlias() {
		return ConferenceAlias;
	}

	public void setConferenceAlias(String ConferenceAlias) {
		this.ConferenceAlias = ConferenceAlias;
	}
	private String ConferenceName;
	private String ConferenceLocation;
	private String ConferenceTopic;
	private String ConferenceOrganiser;
	private String ConferenceAbstract;
	private String ConferencePoster;
	private String ConferenceCertificate;
	private String ConferenceOther;

	public String getConferenceLocation() {
		return ConferenceLocation;
	}

	public void setConferenceLocation(String ConferenceLocation) {
		this.ConferenceLocation = ConferenceLocation;
	}

	public String getConferenceTopic() {
		return ConferenceTopic;
	}

	public void setConferenceTopic(String ConferenceTopic) {
		this.ConferenceTopic = ConferenceTopic;
	}

	public String getConferenceOrganiser() {
		return ConferenceOrganiser;
	}

	public void setConferenceOrganiser(String ConferenceOrganiser) {
		this.ConferenceOrganiser = ConferenceOrganiser;
	}

	public String getConferenceAbstract() {
		return ConferenceAbstract;
	}

	public void setConferenceAbstract(String ConferenceAbstract) {
		this.ConferenceAbstract = ConferenceAbstract;
	}

	public String getConferencePoster() {
		return ConferencePoster;
	}

	public void setConferencePoster(String ConferencePoster) {
		this.ConferencePoster = ConferencePoster;
	}

	public String getConferenceCertificate() {
		return ConferenceCertificate;
	}

	public void setConferenceCertificate(String ConferenceCertificate) {
		this.ConferenceCertificate = ConferenceCertificate;
	}

	public String getConferenceOther() {
		return ConferenceOther;
	}

	public void setConferenceOther(String ConferenceOther) {
		this.ConferenceOther = ConferenceOther;
	}

	/**
	 * Get the value of ConferenceName
	 *
	 * @return the value of ConferenceName
	 */

	public String getConferenceName() {
		return ConferenceName;
	}

	/**
	 * Set the value of ConferenceName
	 *
	 * @param ConferenceName new value of ConferenceName
	 */
	public void setConferenceName(String ConferenceName) {
		this.ConferenceName = ConferenceName;
	}

	public void setConferenceDate(Date date) {
		this.ConferenceDate = date;
	}

}

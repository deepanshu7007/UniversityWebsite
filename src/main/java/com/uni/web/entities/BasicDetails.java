/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities;

import java.util.Date;

/**
 *
 * @author Deepanshu
 */
public class BasicDetails {

	private String link;
	private String workdetail;
private boolean gate,na,jrf,set,net;

	public boolean isGate() {
		return gate;
	}

	public void setGate(boolean gate) {
		this.gate = gate;
	}

	public boolean isNa() {
		return na;
	}

	public void setNa(boolean na) {
		this.na = na;
	}

	public boolean isJrf() {
		return jrf;
	}

	public void setJrf(boolean jrf) {
		this.jrf = jrf;
	}

	public boolean isSet() {
		return set;
	}

	public void setSet(boolean set) {
		this.set = set;
	}

	public boolean isNet() {
		return net;
	}

	public void setNet(boolean net) {
		this.net = net;
	}
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getWorkdetail() {
		return workdetail;
	}

	public void setWorkdetail(String workdetail) {
		this.workdetail = workdetail;
	}
	public BasicDetails(Date reg_date, String supervisor, String cosupervisor, String pgdegree, String exams, String ThesisTitle, Date srfDate, Date reRegDate, Date prePresentation, Date phdAwarded,String link,String workdetail) {
		this.reg_date = reg_date;
		this.supervisor = supervisor;
		this.cosupervisor = cosupervisor;
		this.pgdegree = pgdegree;
		this.exams = exams;
		this.ThesisTitle = ThesisTitle;
		this.srfDate = srfDate;
		this.reRegDate = reRegDate;
		this.prePresentation = prePresentation;
		this.phdAwarded = phdAwarded;
		this.link = link;
		this.workdetail = workdetail;
	}

	

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public String getCosupervisor() {
		return cosupervisor;
	}

	public void setCosupervisor(String cosupervisor) {
		this.cosupervisor = cosupervisor;
	}

	public String getPgdegree() {
		return pgdegree;
	}

	public void setPgdegree(String pgdegree) {
		this.pgdegree = pgdegree;
	}

	public String getExams() {
		return exams;
	}

	public void setExams(String exams) {
		this.exams = exams;
	}

	public String getThesisTitle() {
		return ThesisTitle;
	}

	public void setThesisTitle(String ThesisTitle) {
		this.ThesisTitle = ThesisTitle;
	}

	public Date getSrfDate() {
		return srfDate;
	}

	public void setSrfDate(Date srfDate) {
		this.srfDate = srfDate;
	}

	public Date getReRegDate() {
		return reRegDate;
	}

	public void setReRegDate(Date reRegDate) {
		this.reRegDate = reRegDate;
	}

	public Date getPrePresentation() {
		return prePresentation;
	}

	public void setPrePresentation(Date prePresentation) {
		this.prePresentation = prePresentation;
	}

	public Date getPhdAwarded() {
		return phdAwarded;
	}

	public void setPhdAwarded(Date phdAwarded) {
		this.phdAwarded = phdAwarded;
	}
	private Date reg_date;
	private String supervisor;
	private String cosupervisor;
	private String pgdegree;
	private String exams;
	private String ThesisTitle;
	private Date srfDate;
	private Date reRegDate;
	private Date prePresentation;
	private Date phdAwarded;
}

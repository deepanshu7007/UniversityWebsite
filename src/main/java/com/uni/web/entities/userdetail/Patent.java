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
public class Patent {
	private String PatentId;
	private String PatentTitle;
	private Date PatentDate;
	private Date PublishDate;
	private Date GrandDate;
	private String Author;
	private String AuthorName;

	public String getAuthorName() {
		return AuthorName;
	}

	public void setAuthorName(String AuthorName) {
		this.AuthorName = AuthorName;
	}
	private String CoAuthor;
	private String Uid;

	public String getCoAuthor1() {
		return CoAuthor1;
	}

	public void setCoAuthor1(String CoAuthor1) {
		this.CoAuthor1 = CoAuthor1;
	}

	public String getCoAuthor2() {
		return CoAuthor2;
	}

	public void setCoAuthor2(String CoAuthor2) {
		this.CoAuthor2 = CoAuthor2;
	}

	public String getCoAuthor3() {
		return CoAuthor3;
	}

	public void setCoAuthor3(String CoAuthor3) {
		this.CoAuthor3 = CoAuthor3;
	}

	public String getCoAuthor4() {
		return CoAuthor4;
	}

	public void setCoAuthor4(String CoAuthor4) {
		this.CoAuthor4 = CoAuthor4;
	}

	public String getCoAuthor5() {
		return CoAuthor5;
	}

	public void setCoAuthor5(String CoAuthor5) {
		this.CoAuthor5 = CoAuthor5;
	}
	private String AuthorType;
	private String CoAuthor1;
	private String CoAuthor2;
	private String CoAuthor3;
	private String CoAuthor4;
	private String CoAuthor5;
	private String CoAuthor1name;
	private String CoAuthor2name;
	private String CoAuthor3name;
	private String CoAuthor4name;
	private String CoAuthor5name;

	public String getCoAuthor1name() {
		return CoAuthor1name;
	}

	public void setCoAuthor1name(String CoAuthor1name) {
		this.CoAuthor1name = CoAuthor1name;
	}

	public String getCoAuthor2name() {
		return CoAuthor2name;
	}

	public void setCoAuthor2name(String CoAuthor2name) {
		this.CoAuthor2name = CoAuthor2name;
	}

	public String getCoAuthor3name() {
		return CoAuthor3name;
	}

	public void setCoAuthor3name(String CoAuthor3name) {
		this.CoAuthor3name = CoAuthor3name;
	}

	public String getCoAuthor4name() {
		return CoAuthor4name;
	}

	public void setCoAuthor4name(String CoAuthor4name) {
		this.CoAuthor4name = CoAuthor4name;
	}

	public String getCoAuthor5name() {
		return CoAuthor5name;
	}

	public void setCoAuthor5name(String CoAuthor5name) {
		this.CoAuthor5name = CoAuthor5name;
	}
	public String getAuthorType() {
		return AuthorType;
	}

	public void setAuthorType(String AuthorType) {
		this.AuthorType = AuthorType;
	}

	
	public String getPatentId() {
		return PatentId;
	}

	public void setPatentId(String PatentId) {
		this.PatentId = PatentId;
	}

	public String getPatentTitle() {
		return PatentTitle;
	}

	public void setPatentTitle(String PatentTitle) {
		this.PatentTitle = PatentTitle;
	}

	public Date getPatentDate() {
		return PatentDate;
	}

	public void setPatentDate(Date PatentDate) {
		this.PatentDate = PatentDate;
	}

	public Date getPublishDate() {
		return PublishDate;
	}

	public void setPublishDate(Date PublishDate) {
		this.PublishDate = PublishDate;
	}

	public Date getGrandDate() {
		return GrandDate;
	}

	public void setGrandDate(Date GrandDate) {
		this.GrandDate = GrandDate;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String Author) {
		this.Author = Author;
	}

	public String getCoAuthor() {
		return CoAuthor;
	}

	public void setCoAuthor(String CoAuthor) {
		this.CoAuthor = CoAuthor;
	}

	public String getUid() {
		return Uid;
	}

	public void setUid(String Uid) {
		this.Uid = Uid;
	}
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities.userdetail;

import java.sql.Date;
import java.util.HashMap;

/**
 *
 * @author Deepanshu
 */
public class Publication {
	private HashMap<String,Boolean>indexing;

	public HashMap<String, Boolean> getIndexing() {
		return indexing;
	}

	public void setIndexing(HashMap<String, Boolean> indexing) {
		this.indexing = indexing;
	}
		private String DoiNumber;
		private String CoAuthor_1;
		private String uid;
		private String CoAuthor_2;
		private String CoAuthor_3;
		private String CoAuthor_4;
		private String CoAuthor_5;
		private String CoAuthorName_1;
		private String CoAuthorName_2;
		private String CoAuthorName_3;

	public String getCoAuthor_5() {
		return CoAuthor_5;
	}

	public void setCoAuthor_5(String CoAuthor_5) {
		this.CoAuthor_5 = CoAuthor_5;
	}

	public String getCoAuthorName_1() {
		return CoAuthorName_1;
	}

	public void setCoAuthorName_1(String CoAuthorName_1) {
		this.CoAuthorName_1 = CoAuthorName_1;
	}

	public String getCoAuthorName_2() {
		return CoAuthorName_2;
	}

	public void setCoAuthorName_2(String CoAuthorName_2) {
		this.CoAuthorName_2 = CoAuthorName_2;
	}

	public String getCoAuthorName_3() {
		return CoAuthorName_3;
	}

	public void setCoAuthorName_3(String CoAuthorName_3) {
		this.CoAuthorName_3 = CoAuthorName_3;
	}

	public String getCoAuthorName_4() {
		return CoAuthorName_4;
	}

	public void setCoAuthorName_4(String CoAuthorName_4) {
		this.CoAuthorName_4 = CoAuthorName_4;
	}

	public String getCoAuthorName_5() {
		return CoAuthorName_5;
	}

	public void setCoAuthorName_5(String CoAuthorName_5) {
		this.CoAuthorName_5 = CoAuthorName_5;
	}
		private String CoAuthorName_4;
		private String CoAuthorName_5;

	public String getCoAuthor_2() {
		return CoAuthor_2;
	}

	public void setCoAuthor_2(String CoAuthor_2) {
		this.CoAuthor_2 = CoAuthor_2;
	}

	public String getCoAuthor_3() {
		return CoAuthor_3;
	}

	public void setCoAuthor_3(String CoAuthor_3) {
		this.CoAuthor_3 = CoAuthor_3;
	}

	public String getCoAuthor_4() {
		return CoAuthor_4;
	}

	public void setCoAuthor_4(String CoAuthor_4) {
		this.CoAuthor_4 = CoAuthor_4;
	}
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
		
	public String getCoAuthor_1() {
		return CoAuthor_1;
	}

	public void setCoAuthor_1(String CoAuthor_1) {
		this.CoAuthor_1 = CoAuthor_1;
	}
	private String Title;
	private String Author;
	private String AuthorName;

	public String getAuthorName() {
		return AuthorName;
	}

	public void setAuthorName(String AuthorName) {
		this.AuthorName = AuthorName;
	}
	private String Abstract;
	private String Keyword;
	private String JournalName;
	private String VolumeNumber;
	private double ImpactFactor;
	private String PublicationLink;

	public String getPublicationLink() {
		return PublicationLink;
	}

	public void setPublicationLink(String PublicationLink) {
		this.PublicationLink = PublicationLink;
	}
	public double getImpactFactor() {
		return ImpactFactor;
	}

	public void setImpactFactor(double ImpactFactor) {
		this.ImpactFactor = ImpactFactor;
	}
	public String getDoiNumber() {
		return DoiNumber;
	}

	public void setDoiNumber(String DoiNumber) {
		this.DoiNumber = DoiNumber;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String Title) {
		this.Title = Title;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String Author) {
		this.Author = Author;
	}

	public String getAbstract() {
		return Abstract;
	}

	public void setAbstract(String Abstract) {
		this.Abstract = Abstract;
	}

	public String getKeyword() {
		return Keyword;
	}

	public void setKeyword(String Keyword) {
		this.Keyword = Keyword;
	}

	public String getJournalName() {
		return JournalName;
	}

	public void setJournalName(String JournalName) {
		this.JournalName = JournalName;
	}

	public String getVolumeNumber() {
		return VolumeNumber;
	}

	public void setVolumeNumber(String VolumeNumber) {
		this.VolumeNumber = VolumeNumber;
	}

	public Date getPublicationYear() {
		return PublicationYear;
	}

	public void setPublicationYear(Date PublicationYear) {
		this.PublicationYear = PublicationYear;
	}

	public int getPageNumber() {
		return PageNumber;
	}

	public void setPageNumber(int PageNumber) {
		this.PageNumber = PageNumber;
	}

	public String getReference() {
		return Reference;
	}

	public void setReference(String Reference) {
		this.Reference = Reference;
	}

	public int getCitation() {
		return Citation;
	}

	public void setCitation(int Citation) {
		this.Citation = Citation;
	}

	public boolean isESI() {
		return ESI;
	}

	public void setESI(boolean ESI) {
		this.ESI = ESI;
	}

	public boolean isSCI() {
		return SCI;
	}

	public void setSCI(boolean SCI) {
		this.SCI = SCI;
	}

	public boolean isScopus() {
		return scopus;
	}

	public void setScopus(boolean scopus) {
		this.scopus = scopus;
	}

	public boolean isPeerpaper() {
		return peerpaper;
	}

	public void setPeerpaper(boolean peerpaper) {
		this.peerpaper = peerpaper;
	}

	public boolean isOther() {
		return other;
	}

	public void setOther(boolean other) {
		this.other = other;
	}
	private Date PublicationYear;
	private int PageNumber;
	private String Reference;
	private int Citation;
	private boolean ESI;
	private boolean SCI;
	private boolean scopus;
	private boolean peerpaper;
	private boolean other;

	
	
}

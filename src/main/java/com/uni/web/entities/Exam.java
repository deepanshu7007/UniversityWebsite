/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities;
public class Exam {
	private int ExamId;
	private boolean active;

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	private String ExamName;

	public int getExamId() {
		return ExamId;
	}

	public void setExamId(int ExamId) {
		this.ExamId = ExamId;
	}

	public String getExamName() {
		return ExamName;
	}

	public void setExamName(String ExamName) {
		this.ExamName = ExamName;
	}
	
}

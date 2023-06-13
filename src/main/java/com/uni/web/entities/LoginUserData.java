/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.entities;

/**
 *
 * @author Deepanshu
 */
public class LoginUserData {
	
	private String uid;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public boolean isAction() {
		return action;
	}

	public void setAction(boolean action) {
		this.action = action;
	}

	public boolean isView() {
		return viewData;
	}

	public void setView(boolean view) {
		this.viewData = view;
	}

	public LoginUserData(String uid, boolean action, boolean view) {
		this.uid = uid;
		this.action = action;
		this.viewData = view;
	}
	private boolean action;
	private boolean viewData;

}
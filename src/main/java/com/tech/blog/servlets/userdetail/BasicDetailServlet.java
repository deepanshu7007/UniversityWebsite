/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets.userdetail;

import com.uni.web.dao.UpdateBasicDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.uni.web.entities.User;
import com.uni.web.helper.ConnectionProvider;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

public class BasicDetailServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HashMap<String,Boolean> hm = new HashMap<String,Boolean>();
		hm.put("NA", Boolean.FALSE);
		hm.put("N.E.T.", Boolean.FALSE);
		hm.put("J.R.F.", Boolean.FALSE);
		hm.put("S.E.T.", Boolean.FALSE);
		hm.put("G.A.T.E.", Boolean.FALSE);
		String supervisor = (String) request.getParameter("SuperVisor");
		String cosupervisor = (String) request.getParameter("FIRST_NAME");
		String exams[] = request.getParameterValues("EXAM_QUALIFIED");
		String linktoprofile = request.getParameter("profilelink");
		String checkboxSelections = "";
		if (exams != null) {
			// Convert checkboxValues array to a single string
			for(String exam:exams){
				hm.put(exam, Boolean.TRUE);
			}
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		String uid = user.getUserName();
		String thesistitle = request.getParameter("ThesisTitle");
		Date regdate = java.sql.Date.valueOf((request.getParameter("REG_DATE")));
		Date srfdate;
		Date reregdate;
		Date prephddate;
		Date phddate;
		String srf = request.getParameter("SrfDate");
		if (srf.isEmpty()) {
			// Set a default value or handle the empty case according to your requirement
			srfdate = null; // or set a default date value, e.g., new java.util.Date()
		} else {
			// Convert the dateString to a Date object using SimpleDateFormat or other date parsing methods
			srfdate = java.sql.Date.valueOf(srf);
		}

		String rereg = request.getParameter("RE_REG_DATE");
		if (rereg.isEmpty()) {
			// Set a default value or handle the empty case according to your requirement
			reregdate = null; // or set a default date value, e.g., new java.util.Date()
		} else {
			// Convert the dateString to a Date object using SimpleDateFormat or other date parsing methods
			reregdate = java.sql.Date.valueOf(rereg);
		}
		String prephd = request.getParameter("prePhdDate");
		if (prephd.isEmpty()) {
			// Set a default value or handle the empty case according to your requirement
			prephddate = null; // or set a default date value, e.g., new java.util.Date()
		} else {
			// Convert the dateString to a Date object using SimpleDateFormat or other date parsing methods
			prephddate = java.sql.Date.valueOf(prephd);
		}

		String phd = request.getParameter("phdDate");
		if (phd.isEmpty()) {
			// Set a default value or handle the empty case according to your requirement
			phddate = null; // or set a default date value, e.g., new java.util.Date()
		} else {
			// Convert the dateString to a Date object using SimpleDateFormat or other date parsing methods
			phddate = java.sql.Date.valueOf(phd);
		}
		UpdateBasicDao userDao = new UpdateBasicDao(new ConnectionProvider().getConnection());
		System.out.println("hashmap"+hm.keySet());
		if (userDao.UpdateBasicProfile(uid, supervisor, cosupervisor, hm, thesistitle, reregdate, regdate, srfdate, prephddate, phddate, linktoprofile)) {
			System.out.println("BASIC UPDATES ARE DONE");
		} else {
			System.out.println("SOMETHING WENT WRONG");

		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}

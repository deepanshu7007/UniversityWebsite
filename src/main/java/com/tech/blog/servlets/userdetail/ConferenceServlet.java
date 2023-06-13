/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets.userdetail;

import com.uni.web.dao.AdminDao;
import com.uni.web.dao.ConferenceDao;
import com.uni.web.entities.LoginUserData;
import com.uni.web.entities.User;
import com.uni.web.entities.userdetail.Conference;
import com.uni.web.helper.ConnectionProvider;
import com.uni.web.servlets.AdminServlets.UpdateUserServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Deepanshu
 */
@MultipartConfig
public class ConferenceServlet extends HttpServlet {

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("currentUser");
		String uid = user.getUserName();
		
		try {

					
			Conference conference = new Conference();
			System.out.println("hhhhhhhh"+(String) request.getParameter("conference_id"));
				conference.setConferenceAbstract((String)request.getParameter("conference_abstract"));
				conference.setConferenceOther((String)request.getParameter("conference_others"));
				conference.setConferenceAlias((String) request.getParameter("conference_id"));
				conference.setConferenceLocation((String) request.getParameter("conference_location"));
//				System.out.println(request.getParameter("conference_date"));
				conference.setConferenceCertificate((String) request.getParameter("conference_certificate"));
				conference.setConferenceUID(uid);// SHOULD BE RELACE FURTHER
				conference.setConferenceMode( (String)request.getParameter("conference_mode"));
				conference.setConferenceDate( Date.valueOf(request.getParameter("conference_date")));
				conference.setConferenceTopic( (String)request.getParameter("conference_topic"));
				conference.setConferenceName((String) request.getParameter("conference_name"));
				conference.setConferencePoster((String)request.getParameter("conference_poster"));
				conference.setConferenceOrganiser((String)request.getParameter("conference_organiser"));
				
			
				
			
			ConferenceDao dao = new ConferenceDao(ConnectionProvider.getConnection());
		dao.saveConference(conference);
		}  catch (SQLException ex) {
			Logger.getLogger(ConferenceServlet.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets.userdetail;

import com.uni.web.dao.ConferenceDao;
import com.uni.web.dao.FdpDao;
import com.uni.web.entities.User;
import com.uni.web.entities.userdetail.Conference;
import com.uni.web.entities.userdetail.FDP;
import com.uni.web.helper.ConnectionProvider;
import com.uni.web.servlets.AdminServlets.UpdateUserServlet;
import java.io.IOException;
import java.io.PrintWriter;
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
public class FdpServlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and
	 * <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		try {
HttpSession session=request.getSession();
		User user = (User)session.getAttribute("currentUser");
		String uid = user.getUserName();
			FDP fdp=null;
				fdp=new FDP();
				fdp.setFdpAlias((String)request.getParameter("fdp_id"));
				fdp.setFdpName((String)request.getParameter("fdp_name"));
				fdp.setFdpDuration((String)request.getParameter("fdp_duration"));
				fdp.setFdpLocation((String)request.getParameter("fdp_location"));
				fdp.setFdpTheme((String)request.getParameter("fdp_topic"));
				fdp.setFdpWebsite((String)request.getParameter("fdp_website"));
				fdp.setFdpOutcome((String)request.getParameter("fdp_outcome"));
				fdp.setFdpOther((String)request.getParameter("fdp_other"));
				fdp.setFdpUid(uid);
				
				
			
			FdpDao dao = new FdpDao(ConnectionProvider.getConnection());
		dao.saveFdp(fdp);
		}catch (SQLException ex) {
			Logger.getLogger(FdpServlet.class.getName()).log(Level.SEVERE, null, ex);
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
